Rails.application.routes.draw do
  root 'phones#index'

  namespace :api do
    resources :phone_models, only: :index 
  end
end
