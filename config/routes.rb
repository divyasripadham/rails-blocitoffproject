Rails.application.routes.draw do

  devise_for :users

  root to: "users#show"

  resources :users do
    resources :items, only: [:create, :destroy]
  end

end
