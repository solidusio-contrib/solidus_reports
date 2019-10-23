# frozen_string_literal: true

module SolidusReports
  class Configuration < Spree::Preferences::Configuration
    REPORT_TABS ||= [:reports]

    new_item = Spree::BackendConfiguration::MenuItem.new(
      REPORT_TABS,
      'file',
      condition: -> { can?(:admin, REPORT_TABS) }
    )
    Spree::Backend::Config.menu_items << new_item
  end
end
