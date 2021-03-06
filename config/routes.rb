Rails.application.routes.draw do
  resources :instructions
  root 'application#home'
  resources :ingredients
  resources :items
  resources :planned_meals
  resources :recipes do
    resources :planned_meals, only: [:new] #adds recipe to meal plan
  end
  resources :users do
    resources :recipes, only: [:index] #shows all recipes authored by a user
    resources :planned_meals, only: [:index] #shows user's meal plan
  end
  
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
