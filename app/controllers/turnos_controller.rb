class TurnosController < ApplicationController
    def index
        begin
            @estado = params[:estado]
            @turnos = Turno.where(:estado => params[:estado])
        rescue
            @turnos = Turno.all
        end
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

    def destroy
        @turno = Turno.find(params[:id])
        @turno.destroy
        redirect_to turnos_path(estado: "Pendiente")
    end

    private

    def turno_params
        params.require(:turno).permit(:sucursal_id, :fecha, :hora, :motivo, :estado)
    end
end