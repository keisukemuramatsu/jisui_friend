Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] 
end
