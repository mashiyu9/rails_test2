require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module MyFirstApp
  class Application < Rails::Application

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

  end
end
