Rails.application.routes.draw do
  devise_for :users
  resources :ideas do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    #フォロー機能ルーティング
    member do
      put 'follow'
      put 'unfollow'
      get 'followers'
      get 'follows'
    end
    #get 'users/follow_list/:user_id',to: 'users#follow_list'
    #get 'users/follower_list/:user_id',to:'users#follower_list'
    #//フォロー機能ルーティング
  end

  

  root to: "ideas#index"
end
