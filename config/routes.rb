Rails.application.routes.draw do

  resources :workouts do
    resources :workout_sets
    get :statistic
  end
  resources :excercises

  devise_for :users
  root 'home#index'
end
