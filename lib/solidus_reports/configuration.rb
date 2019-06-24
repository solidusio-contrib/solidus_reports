module SolidusReports
  class Configuration < Spree::Preferences::Configuration
    REPORT_TABS ||= [:reports]

    new_item = Spree::BackendConfiguration::MenuItem.new(
      REPORT_TABS,
      'file',
      condition: -> { current_spree_user && current_spree_user.admin? },
    )

    Spree::Backend::Config.menu_items << new_item
  end
end
