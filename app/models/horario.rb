class Horario < ApplicationRecord
    belongs_to :sucursal
    validates :hora_inicio, :hora_fin, presence: { message: "Por favor complete todos los campos" }
end
