# frozen_string_literal: true

module Spree
  module Admin
    class ReportsController < Spree::Admin::BaseController
      respond_to :html

      class << self
        def available_reports
          @@available_reports
        end

        def add_available_report!(report_key, report_description_key = nil)
          if report_description_key.nil?
            report_description_key = "#{report_key}_description"
          end

          @@available_reports[report_key] = {
            name: report_key,
            description: report_description_key,
          }
        end
      end

      def initialize
        super
        ReportsController.add_available_report!(:sales_total)
        ReportsController.add_available_report!(:sales_total_by_product)
      end

      def index
        @reports = ReportsController.available_reports
      end

      def sales_total_by_product
        params[:q] = search_params

        @search = Order.complete.not_canceled.where(payment_state: "paid").ransack(params[:q])
        @orders = @search.result

        @totals = {}
        @orders.each do |order|
          unless @totals[order.currency]
            @totals[order.currency] = {
              data: {},
              quantity_total: 0,
              sales_total: ::Money.new(0, order.currency)
            }
          end

          order.line_items.each do |line_item|
            unless @totals[order.currency][:data][line_item.variant_id]
              @totals[order.currency][:data][line_item.variant_id] = {
                quantity: 0,
                item_price: line_item.display_price,
                sales_total: ::Money.new(0, order.currency)
              }
            end

            @totals[order.currency][:data][line_item.variant_id][:quantity] += line_item.quantity
            @totals[order.currency][:data][line_item.variant_id][:sales_total] += line_item.display_amount.money

            @totals[order.currency][:quantity_total] += line_item.quantity
            @totals[order.currency][:sales_total] += line_item.display_amount.money
          end
        end
      end

      def sales_total
        params[:q] = search_params

        @search = Order.complete.not_canceled.where(payment_state: "paid").ransack(params[:q])
        @orders = @search.result

        Rails.logger.info("Orders Total: #{@orders.count}")

        @totals = {}
        @orders.each do |order|
          unless @totals[order.currency]
            @totals[order.currency] = {
              item_total: ::Money.new(0, order.currency),
              adjustment_total: ::Money.new(0, order.currency),
              sales_total: ::Money.new(0, order.currency)
            }
          end

          @totals[order.currency][:item_total] += order.display_item_total.money
          @totals[order.currency][:adjustment_total] += order.display_adjustment_total.money
          @totals[order.currency][:sales_total] += order.display_total.money
        end
      end

      @@available_reports = {}

      private

      def search_params
        params.fetch(:q, {}).tap do |q|
          q[:completed_at_gt] = adjust_start_date q[:completed_at_gt]
          q[:completed_at_lt] = adjust_end_date(q[:completed_at_lt]) if q[:completed_at_lt].present?
          q[:s] ||= 'completed_at desc'
        end
      end

      def adjust_start_date(string_date = nil)
        return Time.current.beginning_of_month if string_date.blank?

        Time.zone.parse(string_date).beginning_of_day
      rescue ArgumentError
        Time.current.beginning_of_month
      end

      def adjust_end_date(string_date)
        Time.zone.parse(string_date).end_of_day
      rescue ArgumentError
        ""
      end
    end
  end
end
