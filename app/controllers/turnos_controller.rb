class TurnosController < ApplicationController
    def index
        @turnos = Turno.all
    end

    def show
        @turno = Turno.find(params[:id])
    end

    def new
        @turno = Turno.new
    end

    def create
        @turno = Turno.new(turno_params)
        if @turno.save
            redirect_to turnos_path
        else
            render :new 
        end
    end

    private

    def turno_params
        params.require(:turno).permit(:fecha, :hora, :motivo, :estado)
    end
end