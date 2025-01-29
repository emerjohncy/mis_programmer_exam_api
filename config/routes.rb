Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      # get '/employees', to: 'employees#index'
      # post '/employees', to: 'employees#create'
      
      # get '/positions', to: 'positions#index'
      # post '/positions', to: 'positions#create'

      # get '/companies', to: 'companies#index'
      # post '/companies', to: 'companies#create'
      # put '/companies/:id', to: 'companies#update'

      resources :employees 
      resources :companies
      resources :positions
      resources :employee_companies
    end
  end
end
