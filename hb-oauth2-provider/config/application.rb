require_relative 'boot'

require 'rails/all'
require 'oauth/rack/oauth_filter'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HbOauth2Provider
  class Application < Rails::Application
    config.middleware.use OAuth::Rack::OAuthFilter
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
