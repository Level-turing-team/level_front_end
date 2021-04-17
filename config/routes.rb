Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/register', to: 'users#edit'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#show'
  # get '/profile/:id', to: 'users#show', as: "profile"
  resources :users, only: %i[create update]
  resources :dashboard, only: %i[index]

  get '/auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get '/failure', to: redirect('/')
end
