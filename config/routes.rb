Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/auth/:provider/callback', :to => 'sessions#callback'
  post '/auth/:provider/callback', :to => 'sessions#callback'
  get '/logout' => 'sessions#destroy', :as => :logout
  get '/tweet' => 'tweet_api#tweet'
  post '/save_git' => 'home#git_create'
end
