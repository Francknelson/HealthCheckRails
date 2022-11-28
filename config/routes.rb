Rails.application.routes.draw do
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  get '/clinics_search' => 'home_clinic_search#index'
  get '/clinics_search/:id' => 'home_clinic_search#show'
  get '/professionals_search' => 'home_professional_search#index'
  get '/reports' => 'reports#index'
  get '/appointments_report' => 'appointments#index'

  resources :users do
    resources :addresses
  end

  resources :clinics
  resources :clients
  resources :specialties
  resources :professionals
  resources :appointments do
    get '/cancel' => 'appointments#cancel'
  end
end
