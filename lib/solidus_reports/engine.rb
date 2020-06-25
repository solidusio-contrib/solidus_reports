# frozen_string_literal: true

require 'spree/core'

module SolidusReports
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_reports'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_simple_dash.environment', before: :load_config_initializers do
      SolidusReports::Config = SolidusReports::Configuration.new
    end
  end
end
