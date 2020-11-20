Rails.application.routes.draw do
  devise_for :users
  resources :ideas, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  root to: "ideas#index"
end
