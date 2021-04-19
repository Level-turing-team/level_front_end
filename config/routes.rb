Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/register', to: 'users#edit'
  post '/register', to: 'users#update'
  get '/profile', to: 'users#show'
  post '/logout', to: 'sessions#destroy'
  # get '/profile/:id', to: 'users#show', as: "profile"
  resources :discover, only: %i[index]
  resources :users, only: %i[create update]
  resources :dashboard, only: %i[index]
  post '/galleries', to: 'galleries#create_profile_gallery_picture'

  get '/auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get '/failure', to: redirect('/')
end
