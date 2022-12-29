Rails.application.routes.draw do
  resources :ishbers
  root "projects#index"
  resources :tgers
  
  resources :tgs do
    resources :tgers
  end
  resources :yuks
  resources :projects do
    resources :yuks
    resources :tgs
    resources :ishbers
  end
  devise_for :users

end
