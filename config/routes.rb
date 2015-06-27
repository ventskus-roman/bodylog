Rails.application.routes.draw do

  resources :workouts do
    resources :workout_sets
  end
  resources :excercises

  devise_for :users
  root 'home#index'
end
