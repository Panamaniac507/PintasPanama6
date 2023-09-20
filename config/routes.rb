Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :order_articles
  resources :articles
  resources :orders, only: [:index, :show, :destroy]
  resources :orders do
    resources :article, only: [:index, :show, :destroy]
  end
end
