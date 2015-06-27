Rails.application.routes.draw do


  resources :workouts
  resources :excercises

  devise_for :users
  root 'home#index'
end
