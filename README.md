# Active Storage Colore Service

[![Build Status](https://github.com/ifad/activestorage-colore/actions/workflows/ruby.yml/badge.svg)](https://github.com/ifad/activestorage-colore/actions)
[![RuboCop](https://github.com/ifad/activestorage-colore/actions/workflows/rubocop.yml/badge.svg)](https://github.com/ifad/activestorage-colore/actions/workflows/rubocop.yml)

Active Storage Colore Service is a Ruby-based client for integrating with the [Colore](https://github.com/ifad/colore) service, which provides functionalities for managing and processing color-related data in Active Storage.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activestorage-colore'
```

And then execute:

```sh
bundle install
```

## Usage

To use Active Storage Colore Client, you need to configure it with your Colore service endpoint and any necessary authentication details.

Here is an example of how to configure and use the client:

```ruby
require 'activestorage-colore'

# Configure the client
ActiveStorage::Colore.configure do |config|
  config.endpoint = 'https://your-colore-service-endpoint'
  config.api_key = 'your-api-key'
end

# Example usage
color_data = ActiveStorage::Colore.process(image_path)
puts color_data
```

## Configuration

Configuration options include:
- `endpoint`: The URL of your Colore service endpoint.
- `api_key`: Your API key for authenticating with the Colore service.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file
for details.
