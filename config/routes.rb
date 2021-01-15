Rails.application.routes.draw do

  resources :owners
  resources :pets
  resources :groomers do
    resources :appointments
  end

  get '/register', to: 'sessions#register'
  post '/register', to: 'sessions#registered'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'
  get '/', to: 'sessions#home'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
