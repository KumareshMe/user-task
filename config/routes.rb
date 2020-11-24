Rails.application.routes.draw do
  
  root 'pages#home'
  resources :tasks
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
