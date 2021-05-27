# frozen_string_literal: true

module SolidusReports
  class Configuration < Spree::Preferences::Configuration
    REPORT_TABS = %i[reports].freeze
  end

  Config = Configuration.new
end
