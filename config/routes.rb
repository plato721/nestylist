Rails.application.routes.draw do
  devise_for :users
  root to: "landing#begin"

  resources :inventory, only: [:index]
end
