class TurnosController < ApplicationController
    def index
        @turnos = Turno.all
    end

    def show
        @turno = Turno.find(params[:id])
    end

    def new
        #pp current_usuario.role
        @cliente_id = current_usuario.id
        @sucursales = Sucursal.all
        @turno = Turno.new
    end

    def create
        @turno = Turno.new({:cliente_id => params[:cliente_id], :sucursal_id => params[:sucursal], :fecha => params[:fecha], :hora => params[:hora], :motivo => params[:motivo], :estado => params[:estado] })
        if @turno.save
            redirect_to turnos_path
        else
            render :new 
        end
    end

    private

    def turno_params
        params.require(:turnos).permit(:cliente_id, :sucursal, :fecha, :hora, :motivo, :estado)
    end
end