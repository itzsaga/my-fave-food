Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :places do
    resources :items
  end

  authenticated :user do
    root to: 'places#index', as: :authenticated_root
  end

  root 'static#home'
end
