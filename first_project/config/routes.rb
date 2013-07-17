FirstProject::Application.routes.draw do
  get "sessions/new"

  get "log_in" => "sessions#new", as: "log_in"
  get "sign_up" => "users#new", as: "sign_up"
  get "log_out" => "sessions#destroy", as: "log_out"

  root to: 'pitches#index'
  get '/teams' => 'teams#index'
  resources :users
  resources :sessions
end