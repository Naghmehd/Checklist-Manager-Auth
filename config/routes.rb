Rails.application.routes.draw do

 get '/sign_in', to: 'sessions#sign_in', as: 'sign_in'
 post '/sign_in', to: 'sessions#create'
 get '/sign_out', to: 'sessions#sign_out', as: 'sign_out'
 delete '/sign_out', to: 'sessions#destroy'

 resources :users, only: [:new, :create]

 resources :tasks

 namespace :api do
   resources :tasks
 end

  root 'tasks#index'
end
