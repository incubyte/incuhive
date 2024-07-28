# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :panelists, controllers: {
    sessions: 'panelists/sessions',
    registrations: 'panelists/registrations'
  }

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'

  resources :organizations, only: %i[new create show update] do
    get :create_or_join, on: :collection
    patch :regenerate_invite_code, on: :member
    post :join, on: :collection
    delete :leave, on: :member
  end

  resources :candidates

  resources :interviews do
    get 'edit/:id/:candidate_id', to: 'interviews#edit', as: 'edit_for_candidate', on: :collection
    get 'new/:candidate_id', to: 'interviews#new', as: 'schedule_for_candidate', on: :collection
    get 'show_all/:candidate_id', to: 'interviews#show_all', as: 'show_all_for_candidate', on: :collection
  end
end
