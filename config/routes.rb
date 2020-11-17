Rails.application.routes.draw do
  devise_for :users
  resources :ideas, only: [:index, :new, :create, :show] do
    resources  :orders, only: [:index, :create]
  end
  root to: "ideas#index"
end
