Rails.application.routes.draw do
  devise_for :users
  resources :ideas do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:create, :show]
  resources :messages, only: [:create]
  get 'messages/:id', to: 'messages#checked'
  resources :users, only: [:show, :edit, :update] do
    resources :profiles, only: [ :new, :create, :edit, :update]
    #フォロー機能ルーティング
    member do
      put 'follow'
      put 'unfollow'
      get 'followers'
      get 'follows'
    end
    #//フォロー機能ルーティング
  end

  

  root to: "ideas#index"
end
