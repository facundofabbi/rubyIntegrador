class Sucursal < ApplicationRecord
    has_many :horario
    has_many :turnos
end
