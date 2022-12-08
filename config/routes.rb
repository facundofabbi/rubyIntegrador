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
  get '/turnos/:id/new', to: 'turnos#new', as: :new_turno
  get '/turnos', to: 'turnos#index'
  get '/turnos/:id', to: 'turnos#show', as: :turno
  delete '/turnos/:id', to: 'turnos#destroy', as: :destroy_turno
  # Defines the root path route ("/")

  patch '/sucursales/:id', to: 'sucursales#update'
  get '/sucursales/:id/edit', to: 'sucursales#edit', as: :edit_sucursal
  post '/sucursales/:id/edit', to: 'sucursales#update'
  delete '/sucursales/:id', to: 'sucursales#destroy', as: :destroy_sucursal
  post '/sucursales/new', to: 'sucursales#create'
  get '/sucursales/new', to: 'sucursales#new', as: :new_sucursal
  get '/sucursales', to: 'sucursales#index'
  get '/sucursales_turnos', to: 'sucursales#index_turno'
  get '/sucursales/:id', to: 'sucursales#show', as: :sucursals


  post '/sucursales/:id/horarios/new', to: 'horarios#create'
  get '/sucursales/:id/horarios/new', to: 'horarios#new', as: :new_horario
  get '/sucursales/:id/horarios', to: 'horarios#show', as: :horario

  post '/comentarios/:id/new', to: 'comentarios#create'
  get '/comentarios/:id/new', to: 'comentarios#new', as: :new_comentario
  get 'comentarios/:id', to: 'comentarios#show', as: :comentario





  root "home#index"

end
