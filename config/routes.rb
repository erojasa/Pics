Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'about' => 'pages#about'
  root 'pages#index'
end
