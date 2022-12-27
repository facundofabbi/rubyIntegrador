class Comentario < ApplicationRecord
    belongs_to :turno, class_name: "Turno"
    belongs_to :personal, class_name: "Usuario"
    validates :texto, presence: { message: "Por favor complete solo con texto" }


    def self.eliminar_comentarios(sucursal)
        turnos = Sucursal.find(sucursal.id).turnos
        turnos.each do |tu|
            @comentario = Comentario.where(:turno_id => tu.id).first
            @comentario.destroy
        end
    end

    def self.eliminar_un_comentario(tu_id)
        @comentario = Comentario.where(:turno_id => tu_id).first
        @comentario.destroy
    end
end
