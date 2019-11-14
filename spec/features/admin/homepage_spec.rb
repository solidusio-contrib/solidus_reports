# frozen_string_literal: true

require 'spec_helper'

describe "Homepage", type: :feature do
  context 'as admin user' do
    stub_authorization!

    context "visiting the homepage" do
      before do
        visit spree.admin_path
      end

      it "has a link to reports" do
        expect(page).to have_link("Reports", href: "/admin/reports")
      end
    end
  end

  context 'as fakedispatch user' do
    before do
      allow_any_instance_of(Spree::Admin::BaseController).to receive(:spree_current_user).and_return(nil)
    end

    custom_authorization! do |_user|
      can [:admin, :home], :dashboards
      can [:admin, :edit, :index, :read], Spree::Order
    end

    it 'onlies display tabs fakedispatch has access to' do
      visit spree.admin_path
      expect(page).to have_link('Orders')
      expect(page).not_to have_link('Reports')
      expect(page).not_to have_link('Products')
      expect(page).not_to have_link('Promotions')
      expect(page).not_to have_link('Settings')
    end
  end
end
