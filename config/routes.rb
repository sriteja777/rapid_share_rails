Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  root "dashboard#index"
  resources :users, only: [:new, :create, :edit, :update]
  get 'login', to: 'sessions#new'
  get 'profile', to: 'users#edit'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  
  # get 'upload', to: 'documents#new'
  # post 'upload', to: 'documents#create'
  get 'dashboard', to: "dashboard#index"
  get 'shared', to: "documents#shared", as: "shared_files"
  get 'documents/:id/share/', to: "documents#share", as: "document_share"
  resources :documents
  get 'documents/:id', to: "documents#show", as: "document_show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
