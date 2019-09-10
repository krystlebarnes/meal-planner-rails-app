Rails.application.routes.draw do
  root 'application#home'
  resources :ingredients
  resources :items
  resources :planned_meals
  resources :recipes
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
