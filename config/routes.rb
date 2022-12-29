Rails.application.routes.draw do
  devise_for :usuarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  patch '/users/:id', to: 'users#update'
  post '/users/new', to: 'users#create'
  get '/users/new', to: 'users#new', as: :new_usuario
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :usuario
  get '/users/:id/edit', to: 'users#edit', as: :edit_usuario
  delete '/users/:id/eliminar', to: 'users#destroy', as: :destroy_user


  post '/turnos', to: 'turnos#create'
  get '/turnos/:id/new', to: 'turnos#new', as: :new_turno
  get '/turnos', to: 'turnos#index'
  get '/turnos/:id', to: 'turnos#show', as: :turno
  delete '/turnos/:id', to: 'turnos#destroy', as: :destroy_turno
  get '/turnos/:id/edit', to: 'turnos#edit', as: :edit_turno
  post '/turnos/:id/edit', to: 'turnos#edit'
  patch '/turnos/:id', to: 'turnos#update'
  # Defines the root path route ("/")

  get '/sucursals/new', to: 'sucursals#new', as: :new_sucursal
  get '/sucursals/:id', to: 'sucursals#show', as: :sucursal
  post '/sucursals/new', to: 'sucursals#create'
  patch '/sucursals/:id/edit', to: 'sucursals#update'
  post '/sucursals/:id', to: 'sucursals#update'
  get '/sucursals/:id/edit', to: 'sucursals#edit', as: :edit_sucursal
  post '/sucursals/:id/edit', to: 'sucursals#update' , as: :update_sucursal
  delete '/sucursals/:id', to: 'sucursals#destroy', as: :destroy_sucursal
 
  get '/sucursals', to: 'sucursals#index', as: :sucursals
  get '/sucursals_turnos', to: 'sucursals#index_turno'



  delete '/sucursals/:id/horarios', to: 'horarios#destroy', as: :destroy_horario
  post '/sucursals/:id/horarios/new', to: 'horarios#create'
  get '/sucursals/:id/horarios/new', to: 'horarios#new', as: :new_horario
  get '/sucursals/:id/horarios', to: 'horarios#show', as: :horario
  get '/sucursals/:id/horarios/edit', to: 'horarios#edit', as: :edit_horario
  patch '/sucursals/:id/horarios', to: 'horarios#update'

  post '/comentarios/:id/new', to: 'turnos#createComentario'
  get '/comentarios/:id/new', to: 'turnos#newComentario', as: :new_comentario
  get 'comentarios/:id', to: 'turnos#showComentario', as: :comentario





  root "home#index"

end
