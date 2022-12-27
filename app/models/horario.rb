class Horario < ApplicationRecord
    belongs_to :sucursal
    validates :hora_inicio, :hora_fin, presence: { message: "Por favor complete todos los campos" }
    #validates :nombre, uniqueness: { case_sensitive: false } tengo q buscar como hacer para q valide q no exista un dia con esa sucursal :D
    validates :dia, uniqueness: {scope: :sucursal_id}
end
