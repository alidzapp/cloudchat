Rails.application.routes.draw do
  
  devise_for :users
  resources :posts

  authenticated :user do
    root 'conversations#index'
    get '/profile', to: "static_pages#profile"
    get '/request_friend', to: "static_pages#request_friend"
    get '/add_friend', to: "static_pages#add_friend"
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "static_pages#index"
    end
  end

  resources :conversations do
    resources :messages
  end
end
