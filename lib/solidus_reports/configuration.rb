module SolidusReports
  class Configuration < Spree::Preferences::Configuration
    REPORT_TABS ||= [:reports]

    if Spree.respond_to?(:solidus_version) && Spree.solidus_version > '1.4'
      new_item = Spree::BackendConfiguration::MenuItem.new(REPORT_TABS, 'file')
      Spree::Backend::Config.menu_items << new_item
    end
  end
end
