Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  resources :places do
    resources :items, only: %i[index create new edit]
  end
  resources :items

  authenticated :user do
    root to: 'places#index', as: :authenticated_root
  end

  root 'static#home'
  get 'favorites', to: 'static#favorites'
end
