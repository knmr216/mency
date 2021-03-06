Rails.application.routes.draw do
  devise_for :brands, controllers: {
    sessions: 'brands/sessions',
    passwords: 'brands/passwords',
    registrations: 'brands/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    resources :reviews, only: [:new, :create, :show]
  end
  resources :users, only: :show
  resources :brands, only: :show
end