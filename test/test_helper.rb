# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require 'simplecov'

SimpleCov.start do
  add_filter %w[version.rb]
end

require 'minitest/autorun'
require 'minitest/mock'

require 'byebug'

require 'active_storage'
require 'activestorage/service/colore_service'
