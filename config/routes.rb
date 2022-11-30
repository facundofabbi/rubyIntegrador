Rails.application.routes.draw do
  devise_for :usuarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  patch '/users/:id', to: 'users#update'
  post '/users/new', to: 'users#create'
  get '/users/new', to: 'users#new', as: :new_usuario
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :usuario
  get '/users/:id/edit', to: 'users#edit', as: :edit_usuario

  post '/turnos', to: 'turnos#create'
  get '/turnos/new', to: 'turnos#new', as: :new_turno
  get '/turnos', to: 'turnos#index'
  get '/turnos/:id', to: 'turnos#show', as: :turno
  # Defines the root path route ("/")


  post '/sucursales/new', to: 'sucursales#create'
  get '/sucursales/new', to: 'sucursales#new', as: :new_sucursal
  get '/sucursales', to: 'sucursales#index'
  get '/sucursales/:id', to: 'sucursales#show', as: :sucursals


  post '/sucursales/:id/horarios/new', to: 'horarios#create'
  get '/sucursales/:id/horarios/new', to: 'horarios#new', as: :new_horario




  root "home#index"

end
