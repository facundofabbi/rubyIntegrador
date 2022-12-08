class Comentario < ApplicationRecord
    belongs_to :turno, class_name: "Turno"
    belongs_to :personal, class_name: "Usuario"


    def self.eliminar_comentarios(sucursal)
        turnos = Sucursal.find(sucursal.id).turnos
        turnos.each do |tu|
            @comentario = Comentario.where(:turno_id => tu.id).first
            @comentario.destroy
        end
    end
end
