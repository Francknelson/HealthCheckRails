Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :addresses
  resources :specialties
  resources :clinics
  resources :people
  resources :professionals
  resources :doctors_appointments
end
