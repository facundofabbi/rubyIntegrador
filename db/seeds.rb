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

Usuario.create(:nombre => "Administrador principal", :email => "admin@admin", :password => "123456", :password_confirmation => "123456", :role => "Admin")
Usuario.create(:nombre => "Personal bancario", :email => "personal@personal", :password => "123456", :password_confirmation => "123456", :role => "Personal Bancario", :sucursal_id => "1")

Usuario.create(:nombre => "Cliente", :email => "cliente@cliente", :password => "123456", :password_confirmation => "123456")
Usuario.create(:nombre => "ClienteB", :email => "clienteB@cliente", :password => "123456", :password_confirmation => "123456")
Usuario.create(:nombre => "ClienteC", :email => "clienteC@cliente", :password => "123456", :password_confirmation => "123456")
Usuario.create(:nombre => "ClienteD", :email => "clienteD@cliente", :password => "123456", :password_confirmation => "123456")
Usuario.create(:nombre => "ClienteE", :email => "clienteE@cliente", :password => "123456", :password_confirmation => "123456")



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
