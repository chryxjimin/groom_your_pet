Rails.application.routes.draw do
  resources :owners
  resources :appointments
  resources :groomers
  resources :pets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
