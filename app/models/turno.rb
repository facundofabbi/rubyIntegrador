class Turno < ApplicationRecord
    belongs_to :sucursal, class_name: "Sucursal"
    belongs_to :cliente, class_name: "Usuario"
    belongs_to :personal, class_name: "Usuario", optional:true
    validates :fecha, :hora, :motivo , presence: { message: "Por favor complete todos los campos" }
    validates :comentario, presence: { message: "Por favor complete solo con texto" }
    

    def self.cargar_personal_y_estado(personal,tur)
        @turno = Turno.find(tur)
        @turno.update(:personal_id => personal, :estado => "Atendido")
    end

    def self.eliminar_turnos(user_id)
        turnos = Turno.where('personal_id=? OR cliente_id=?', user_id, user_id)
        turnos.each do |tu|
            tu.destroy
        end
    
    end
end
