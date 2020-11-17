Rails.application.routes.draw do
  devise_for :users
  resources :ideas, only: [:index, :new, :create, :show]
  resources  :orders, only: [:index, :create]
  root to: "ideas#index"
end
