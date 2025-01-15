require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kinkin
  class Application < Rails::Application
    # 無効化する設定
    config.action_controller.raise_on_missing_callback_actions = false

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # 自動読み込みするパス設定（不要な場合は削除）
    # 必要に応じて以下の行を有効化
    # config.autoload_paths += %W(#{config.root}/lib)

    # 時間帯設定（必要に応じて変更）
    config.time_zone = "Asia/Tokyo"  # 日本時間を設定

    # 必要な場合はeager_load_pathsを追加
    # config.eager_load_paths << Rails.root.join("extras")

    # CSRF保護の有効化
    config.action_controller.allow_forgery_protection = true
  end
end
