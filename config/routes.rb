Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :profiles

  resources :users, only: %i[show] do
    resources :appointments, only: %i[index]
  end

  resources :offers, only: %i[index new create show destroy edit update] do
    resources :appointments, only: %i[new create destroy update edit]
  end
  # root "articles#index"
end
