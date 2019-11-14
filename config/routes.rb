# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :reports, only: [:index] do
      collection do
        get :sales_total
        post :sales_total
      end
    end
  end
end
