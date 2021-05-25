Rails.application.routes.draw do
  
  root 'top_pages#top'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',   to: 'users#new'
  resources :groups do
    member do
      get :members
      get :join
      delete :exit
    end
  end
  resources :users
end
