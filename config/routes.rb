Rails.application.routes.draw do
  resources :articles
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  
  resources :users, except: [:new]
end
