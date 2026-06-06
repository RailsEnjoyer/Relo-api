# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resource :session
  resources :passwords, param: :token

  namespace :v1 do
    namespace :guest_space do
      get 'landing_neighborhoods', to: 'neighborhoods#index'
      get 'listings', to: 'listings#index'
    end

    resource :profile, only: %i[show update]
    resources :users
    resource :session, only: %i[create destroy]

    post 'relocation_plans', to: 'relocation_plans#create'
  end
end
