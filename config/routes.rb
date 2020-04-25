Rails.application.routes.draw do
  devise_for :users
  root to: "landing#begin"

  resources :inventory, only: [:index, :create]

  namespace :test do
    resources :users, only: [:none], defaults: {format: :json} do
      collection do
        delete :destroy_username
      end
    end
  end
end
