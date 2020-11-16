Rails.application.routes.draw do
  devise_for :users
  resources :ideas, only: [:index, :new, :create, :show]
  root to: "ideas#index"
end
