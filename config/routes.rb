Rails.application.routes.draw do
  root 'phones#index'

  namespace :api do
    get '/phone_model', to: "phone_models#show"
    resources :phone_models, only: [:index] do
      get 'search', on: :collection
    end
  end
end
