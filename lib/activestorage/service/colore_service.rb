# frozen_string_literal: true

module ActiveStorage
  class Service
    # = Active Storage \Colore \Service
    #
    # Wraps the Colore Client as an Active Storage service.
    # See ActiveStorage::Service for the generic API documentation that applies to all services.
    class ColoreService < Service
      attr_reader :app, :client, :colore_url

      def initialize(app:, colore_url:, **) # rubocop:disable Lint/MissingSuper
        @app = app
        @colore_url = colore_url
        @client = ::Colore::Client.new(base_uri: colore_url, app: app)
      end

      def upload(key, io, **)
        connection.create_document(
          doc_id: key,
          filename: filename,
          content: io.read
        )
      end

      def download(key)
        client.get_document(doc_id: key, version: :current, filename: 'file').body
      end

      def download_chunk(_key, _range)
        ''
      end

      def delete(key)
        client.delete_document(doc_id: key)
      end

      def exist?(key)
        download(key).present?
      end

      def url(key, **options)
        instrument :url, key: key do |payload|
          generated_url = public_url(key, **options)

          payload[:url] = generated_url

          generated_url
        end
      end

      private

      def public_url(key, **options)
        base = "#{colore_url}/document/#{app}/#{key}/current/#{options[:filename]}"
        [base, options[:format]].compact.join('.')
      end
    end
  end
end
