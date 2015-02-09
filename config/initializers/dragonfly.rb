require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick,
    convert_command:  'C:/Bitnami/rubystack-1.9.3-27/imagemagick/convert.exe',
    identify_command: 'C:/Bitnami/rubystack-1.9.3-27/imagemagick/identify.exe'

  verify_urls true

  secret '48db20ee4fae92ea7e9fadcc2492780ac38134371b2f2a76e9230cbab1ecb8e4'

  url_format '/images/dynamic/:job/:basename.:ext'

  fetch_file_whitelist /public/

  fetch_url_whitelist /.+/
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware