Rails.application.routes.draw do
  root   'static_pages#home'

  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  post "/sessions" => "sessions#create"

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  get "/notes" => "notes#index"
  post "/notes" => "notes#create"
  get "/notes/:id" => "notes#show"
  patch "/notes/:id" => "notes#update"
  delete "/notes/:id" => "notes#destroy"

  get "/categories" => "categories#index"
  post "/categories" => "categories#create"
  get "/categories/:id" => "categories#show"
  patch "/categories/:id" => "categories#update"
  delete "/categories/:id" => "categories#destroy"
  # end
end
