Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root to: 'static_pages#home'

  match '/signup',  to: 'users#create',         via: 'post'
  match '/login' ,  to: 'sessions#create',      via: 'post'
  match '/login' ,  to: 'sessions#new',         via: 'get'
  match '/logout',  to: 'sessions#destroy',     via: 'delete'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  resources :users
  resources :account_activations, only: [:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
