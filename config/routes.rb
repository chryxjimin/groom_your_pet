Rails.application.routes.draw do
  resources :owners
  
  # resources :groomers do 
  #   resources :appointments
  # end

  resources :groomers
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
