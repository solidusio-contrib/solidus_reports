# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusReports
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_reports'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "solidus_reports.environment", before: :load_config_initializers do
      Spree::Backend::Config.menu_items << Spree::BackendConfiguration::MenuItem.new(
        label: :reports,
        icon: 'file',
        condition: -> { can?(:admin, :reports) }
      )
    end
  end
end
