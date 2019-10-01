Rails.application.routes.draw do
  root 'application#home'
  resources :ingredients
  resources :items
  resources :planned_meals
  resources :recipes
  resources :users
  resources :identities
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
