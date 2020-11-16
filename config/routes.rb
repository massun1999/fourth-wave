Rails.application.routes.draw do
  devise_for :users
  resources :ideas, only: [:index, :new, :create]
  root to: "ideas#index"
end
