Rails.application.routes.draw do
  resources :workouts

  devise_for :users
  root 'home#index'
end
