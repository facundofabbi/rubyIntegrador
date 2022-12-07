class Turno < ApplicationRecord
    belongs_to :sucursal, class_name: "Sucursal"
    belongs_to :cliente, class_name: "Usuario"
    belongs_to :personal, class_name: "Usuario", optional:true
end
