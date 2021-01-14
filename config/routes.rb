Rails.application.routes.draw do

  resources :owners
  resources :pets
  resources :groomers
  resources :appointments

  get '/register', to: 'groomers#new'
  post '/register', to: 'sessions#register'
  get '/login', to: 'sessions#new'
  post '/login', to: 'session#create'
  get '/', to: 'sessions#home'
  # resources :groomers do 
  #   resources :appointments
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
