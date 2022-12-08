# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Sucursal.create(:nombre => "La Plata", :direccion => "7 y 50", :telefono => "221123456")
Sucursal.create(:nombre => "Villa Gesell", :direccion => "124 y 3", :telefono => "36589")
Sucursal.create(:nombre => "Lanus", :direccion => "La valle y alcorta", :telefono => "75436")
Sucursal.create(:nombre => "Villa Elisa", :direccion => "489 y 13", :telefono => "36542")
Sucursal.create(:nombre => "Gonnet", :direccion => "511 y centenario", :telefono => "785236")

Usuario.create(:nombre => "Administrador principal", :email => "admin@admin", :password => "123456", :password_confirmation => "123456", :role => "Administrador")
Usuario.create(:nombre => "Administrador B", :email => "adminB@admin", :password => "123456", :password_confirmation => "123456", :role => "Administrador")

Usuario.create(:nombre => "Personal bancario de prueba", :email => "personal@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "1")
Usuario.create(:nombre => "Personal bancario 2", :email => "personalB@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "1")

Usuario.create(:nombre => "Personal bancario 3", :email => "personalC@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "2")
Usuario.create(:nombre => "Personal bancario 4", :email => "personalD@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "2")

Usuario.create(:nombre => "Personal bancario 5", :email => "personalE@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "3")
Usuario.create(:nombre => "Personal bancario 6", :email => "personalF@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "3")



Usuario.create(:nombre => "Cliente", :email => "cliente@cliente", :password => "123456", :password_confirmation => "123456") #9
Usuario.create(:nombre => "ClienteB", :email => "clienteB@cliente", :password => "123456", :password_confirmation => "123456") #10
Usuario.create(:nombre => "ClienteC", :email => "clienteC@cliente", :password => "123456", :password_confirmation => "123456") #11
Usuario.create(:nombre => "ClienteD", :email => "clienteD@cliente", :password => "123456", :password_confirmation => "123456") #12
Usuario.create(:nombre => "ClienteE", :email => "clienteE@cliente", :password => "123456", :password_confirmation => "123456") #13



Horario.create(:dia => "Lunes", :hora_inicio => "09:00", :hora_fin => "16:00", :sucursal_id => 1)
Horario.create(:dia => "Martes", :hora_inicio => "10:00", :hora_fin => "17:00", :sucursal_id => 1)
Horario.create(:dia => "Miercoles", :hora_inicio => "09:00", :hora_fin => "16:00", :sucursal_id => 1)
Horario.create(:dia => "Jueves", :hora_inicio => "10:00", :hora_fin => "17:00", :sucursal_id => 1)
Horario.create(:dia => "Viernes", :hora_inicio => "09:00", :hora_fin => "16:00", :sucursal_id => 1)

Horario.create(:dia => "Lunes", :hora_inicio => "11:00", :hora_fin => "19:00", :sucursal_id => 2)
Horario.create(:dia => "Martes", :hora_inicio => "10:00", :hora_fin => "17:00", :sucursal_id => 2)
Horario.create(:dia => "Miercoles", :hora_inicio => "07:00", :hora_fin => "12:00", :sucursal_id => 2)
Horario.create(:dia => "Jueves", :hora_inicio => "10:00", :hora_fin => "17:00", :sucursal_id => 2)
Horario.create(:dia => "Viernes", :hora_inicio => "09:00", :hora_fin => "16:00", :sucursal_id => 2)

Horario.create(:dia => "Lunes", :hora_inicio => "16:00", :hora_fin => "20:00", :sucursal_id => 3)
Horario.create(:dia => "Martes", :hora_inicio => "11:00", :hora_fin => "17:00", :sucursal_id => 3)
Horario.create(:dia => "Miercoles", :hora_inicio => "06:00", :hora_fin => "16:00", :sucursal_id => 3)
Horario.create(:dia => "Jueves", :hora_inicio => "19:00", :hora_fin => "20:00", :sucursal_id => 3)
Horario.create(:dia => "Viernes", :hora_inicio => "11:00", :hora_fin => "16:00", :sucursal_id => 3)

Horario.create(:dia => "Miercoles", :hora_inicio => "11:00", :hora_fin => "16:00", :sucursal_id => 4)

Turno.create(:fecha => "02-01-2023", :hora => "11:00", :motivo => "Prestamos de $700", :estado => "Pendiente", :sucursal_id => 1, :cliente_id => 9)
Turno.create(:fecha => "02-01-2023", :hora => "12:00", :motivo => "Consulta bancaria por motivos de cobros", :estado => "Pendiente", :sucursal_id => 2, :cliente_id => 9)
Turno.create(:fecha => "04-01-2023", :hora => "08:00", :motivo => "Sin Motivo", :estado => "Pendiente", :sucursal_id => 3, :cliente_id => 9)

Turno.create(:fecha => "02-01-2023", :hora => "11:00", :motivo => "Prestamo de casa", :estado => "Pendiente", :sucursal_id => 1, :cliente_id => 10)
Turno.create(:fecha => "02-01-2023", :hora => "12:00", :motivo => "Prestamo de un inflable", :estado => "Pendiente", :sucursal_id => 2, :cliente_id => 10)
Turno.create(:fecha => "04-01-2023", :hora => "08:00", :motivo => "Prestamo para poder comprar una ventana", :estado => "Pendiente", :sucursal_id => 3, :cliente_id => 10)

Turno.create(:fecha => "03-01-2023", :hora => "11:00", :motivo => "Preguntas por alta de cuenta", :estado => "Atendido", :sucursal_id => 1, :cliente_id => 9, :personal_id => 3)#7
Turno.create(:fecha => "03-01-2023", :hora => "11:00", :motivo => "Quiero cerar mi cuenta", :estado => "Atendido", :sucursal_id => 2, :cliente_id => 9, :personal_id => 3)#8

Turno.create(:fecha => "03-01-2023", :hora => "11:00", :motivo => "Dudas de un prestamo que solicite", :estado => "Atendido", :sucursal_id => 1, :cliente_id => 10, :personal_id => 3)#9
Turno.create(:fecha => "03-01-2023", :hora => "11:00", :motivo => "Hola motivo", :estado => "Atendido", :sucursal_id => 2, :cliente_id => 10, :personal_id => 3)#10

Turno.create(:fecha => "03-01-2023", :hora => "11:00", :motivo => "Porq si", :estado => "Atendido", :sucursal_id => 5, :cliente_id => 10, :personal_id => 3)#11

Comentario.create(:texto => "Se finalizo con exito la consulta que tenia el cliente sobre el prestamo", :turno_id=> 7 , :personal_id => 3 )
Comentario.create(:texto => "Probando texto del comentario", :turno_id=> 8 , :personal_id => 3 )
Comentario.create(:texto => "Ya se termino", :turno_id=> 9 , :personal_id => 3 )
Comentario.create(:texto => "No vino a la consulta", :turno_id=> 10 , :personal_id => 3 )
Comentario.create(:texto => "Termine el trabajo(creo)", :turno_id=> 11 , :personal_id => 3 )