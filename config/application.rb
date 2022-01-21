require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CelAstro
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.i18n.fallbacks = [:en]
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Taipei"
    # config.eager_load_paths << Rails.root.join("extras")

    # 設定載入路徑
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

    # 設定預設語系
    config.i18n.default_locale = 'zh-TW'
    I18n.available_locales = [:'zh-TW', :zh, :en]

    # 若缺少該語系則以哪個語系取代
    config.i18n.fallbacks = {:en => :'zh-TW' }
  end
end
