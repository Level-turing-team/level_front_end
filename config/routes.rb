Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'welcome#index'
  end

  # devise_for :users, root_path: {
  #     sign_in: 'login', sign_out: 'logout',
  #     password: 'secret', confirmation: 'verification',
  #     registration: 'register', edit: 'edit/profile'
  #   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/register', to: 'sessions#new'
  post '/register', to: 'sessions#create'
  get '/profile', to: 'users#show'
  # get '/profile/:id', to: 'users#show', as: "profile"
  resources :discover, only: %i[index]
  resources :users, only: %i[create update]
  resources :dashboard, only: %i[index]

  get '/auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get '/failure', to: redirect('/')
end
