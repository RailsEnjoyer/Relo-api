# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resource :session
  resources :passwords, param: :token

  namespace :v1 do
    namespace :guest_space do
      get 'landing_neighborhoods', to: 'neighborhoods#index'
      get 'landing_listings', to: 'listings#index'
    end

    resources :users
    resource :session, only: %i[create destroy]

    resource :profile, only: %i[show update]

    get 'listings', to: 'listings#index'

    resources :saved_listings, param: :listing_id, only: %i[index create destroy]

    get 'dashboard', to: 'dashboards#index'

    post 'relocation_plans', to: 'relocation_plans#create'
  end
end
