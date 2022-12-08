class Sucursal < ApplicationRecord
    has_many :horario, dependent: :destroy
    has_many :turnos, dependent: :destroy
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

    def self.chequear_eliminar(sucursal_id)
        usuarios = Sucursal.find(sucursal_id).usuarios
        turnos = Sucursal.find(sucursal_id).turnos
        if usuarios.empty?
            turnos.each do |tu|
                if tu.estado == "Pendiente"
                    return false
                end
            end
        else
            return false
        end
        return true
    end
end