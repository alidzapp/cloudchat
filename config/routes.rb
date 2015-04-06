Rails.application.routes.draw do
  
  devise_for :users

  authenticated :user do
    root 'conversations#index'
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
