class Turno < ApplicationRecord
    belongs_to :sucursal, class_name: "Sucursal"
    belongs_to :cliente, class_name: "Usuario"
    belongs_to :personal, class_name: "Usuario", optional:true

    def self.cargar_personal_y_estado(personal,tur)
        pp "ESTE ES EL TURNO Q ME LLEGA", tur
        @turno = Turno.find(tur)
        @turno.update(:personal_id => personal, :estado => "Atendido")
    end
end
