FirstProject::Application.routes.draw do
  root to: 'pitches#index'
  get '/teams' => 'teams#index'
end