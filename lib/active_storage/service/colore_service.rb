module ActiveStorage
  class Service::ColoreService < Service
    attr_reader :app, :colore_url

    def connection
      options = {base_uri: colore_url, app: app}
      ::Colore::Client.new(options)
    end

    def initialize(app:, public: false, colore_url:, **options)
      @app = app
      @colore_url = colore_url
      @public = true
    end

    def upload(key, io, checksum: nil, **options)
      connection.create_document({
        doc_id:       key,
        filename:     filename,
        content:      io.read
      })
    end

    def download(key)
      connection.get_document({ doc_id: key, version: :current, filename: "file" }).body
    end

    def download_chunk(key, range)
      ""
    end

    def delete(key)
      connection.delete_document({ doc_id: key })
    end    

    def exist?(key)
      !download(key).blank?
    end

    def url(key, **options)
      instrument :url, key: key do |payload|
        generated_url =
          if public?
            public_url(key, **options)
          else
            private_url(key, **options)
          end

        payload[:url] = generated_url

        generated_url
      end
    end

    def public?
      @public
    end

    private

    def public_url(key, **options)
      puts options
      base = "#{colore_url}/document/#{app}/#{key}/current/#{options[:filename]}"
      [base,options[:format]].compact.join(".")
    end

  end
end