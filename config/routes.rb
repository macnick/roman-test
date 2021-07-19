Rails.application.routes.draw do
  root 'static#index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy]
      resources :posts, only: [:index, :show, :create, :destroy]
      resources :comments, only: [:index, :create, :destroy]
    end
  end
end
