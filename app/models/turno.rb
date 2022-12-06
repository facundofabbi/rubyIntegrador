class Turno < ApplicationRecord
    belongs_to :sucursal_id
    belongs_to :cliente_id, class_name: "usuario"
    belongs_to :personal_id, class_name: "usuario"
end
