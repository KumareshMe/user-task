Rails.application.routes.draw do
  
  root 'pages#home'
  
  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :tasks do
    member do
      patch :complete
    end
  end
  
end
