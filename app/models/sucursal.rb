class Sucursal < ApplicationRecord
    has_many :horario
    has_many :turnos
    has_many :usuarios

    def self.chequear_turno(dia,hora_solicitada,sucursal_id)
        horarios = Sucursal.find(sucursal_id).horario
        horarios.each do |ho|
            if ho.dia == dia
                if hora_solicitada.between?(ho.hora_inicio.strftime("%H:%M"),ho.hora_fin.strftime("%H:%M"))
                    return true
                else
                    return false
                end
            end
        end
        false
    end
end
