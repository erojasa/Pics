Rails.application.routes.draw do
  resources :posts do
    resources :comments
    resources :likes
  end

  get '/posts/page/:number', to: 'posts#pages'

  devise_for :users, controllers: { registrations: 'registrations' }


  root 'posts#index'
end
