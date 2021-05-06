Rails.application.routes.draw do
  resources :posts do
    resources :comments
    end
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'about', to: 'pages#about'

  root 'posts#index'
end
