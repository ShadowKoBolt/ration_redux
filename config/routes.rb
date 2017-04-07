Rails.application.routes.draw do
  devise_for :users
  root to: 'plans#index'
  resources :plans do
    resources :days do
      resources :meals
    end
  end
  resources :recipes do
    resources :ingredients
  end
  resources :foods
end
