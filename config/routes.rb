Rails.application.routes.draw do

  resources :owners
  resources :pets
  resources :groomers
  resources :appointments

  get '/signup', to: 'sessions#new'
  get '/login', to: 'sessions#login'
  get '/', to: 'sessions#home'
  # resources :groomers do 
  #   resources :appointments
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
