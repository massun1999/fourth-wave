Rails.application.routes.draw do
  get 'ideas/index'
  root to: "ideas#index"
end
