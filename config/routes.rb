Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :places do
    resources :items, only: %i[index create new edit]
  end
  resources :items, only: %i[show]

  authenticated :user do
    root to: 'places#index', as: :authenticated_root
  end

  root 'static#home'
end
