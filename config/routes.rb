Rails.application.routes.draw do
  
  devise_for :users
  resources :posts

  authenticated :user do
    root 'conversations#index'
    get '/profile' => "static_pages#profile"
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
