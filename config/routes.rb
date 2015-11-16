Rails.application.routes.draw do
  get 'items/create'

  # get 'users/show'

  # get 'home/index'

  devise_for :users

  root to: "users#show"

  resources :users do
      resources :items, only: [:create, :destroy]
  end

end
