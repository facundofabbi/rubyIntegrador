Rails.application.routes.draw do
  devise_for :usuarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/usuarios', to: 'usuarios#index'
  # Defines the root path route ("/")
  root "home#index"

end
