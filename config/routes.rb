Rails.application.routes.draw do
  devise_for :users
  resources :ideas do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
  root to: "ideas#index"
end
