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

  get '/galleries', to: 'galleries#index'
  post '/galleries', to: 'galleries#create_gallery_and_photo'

  get '/auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get '/failure', to: redirect('/')
end
