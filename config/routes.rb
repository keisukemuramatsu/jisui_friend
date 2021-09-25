Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :recipes
  resources :users, only: [:index, :show, :edit, :update]
end
