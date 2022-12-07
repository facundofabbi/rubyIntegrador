class TurnosController < ApplicationController
    def index
        @turnos = Turno.all
    end

    def show
        @turno = Turno.find(params[:id])
    end

    def new
        @cliente_id = current_usuario.id
        @sucursal = Sucursal.find(params[:id])
        @turno = Turno.new
    end

    def create
        #pp "fecha formateada para obtener el nombre del dia",I18n.l(Date.parse(params[:turno][:fecha].to_s),format: '%A')
        pp "esto me devuelve:",Sucursal.chequear_turno(I18n.l(Date.parse(params[:turno][:fecha].to_s),format: '%A'),params[:turno][:hora],params[:turno][:sucursal_id])
        if Sucursal.chequear_turno(I18n.l(Date.parse(params[:turno][:fecha].to_s),format: '%A'),params[:turno][:hora],params[:turno][:sucursal_id])
            @turno = Turno.new(turno_params)
            @turno.cliente_id = current_usuario.id
            if @turno.save
                redirect_to sucursales_turnos_path
            else
                render :new 
            end
        else
            redirect_to sucursales_path
        end
    end

    private

    def turno_params
        params.require(:turno).permit(:sucursal_id, :fecha, :hora, :motivo, :estado)
    end
end