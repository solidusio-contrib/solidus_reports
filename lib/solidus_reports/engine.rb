# frozen_string_literal: true

require 'spree/core'
require_relative './config'

module SolidusReports
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_reports'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_reports.add_admin_section' do
      ::Spree::Backend::Config.configure do |config|
        config.menu_items << config.class::MenuItem.new(
          Configuration::REPORT_TABS,
          'file',
          condition: -> { can?(:admin, :reports) }
        )
      end
    end
  end
end
