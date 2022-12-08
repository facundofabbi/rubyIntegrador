class Comentario < ApplicationRecord
    belongs_to :turno, class_name: "Turno"
    belongs_to :personal, class_name: "Usuario"
end
