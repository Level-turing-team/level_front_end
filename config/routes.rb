Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/register', to: 'users#new'
  resources :users, only: %i[create edit]
  resources :dashboard, only: %i[index]
end
