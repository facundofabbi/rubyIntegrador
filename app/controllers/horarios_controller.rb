class HorariosController < ApplicationController
    def new
        @horarios = Horario.new
        @sucursal = Sucursal.find(params[:id])
    end

    def create
        @horario = Horario.new({:dia => params[:dia], :hora_inicio => params[:hora_inicio], :hora_fin => params[:hora_fin], :sucursal_id => params[:sucursal_id] })
        if @horario.save
            redirect_to sucursales_path
        else
            render :new 
        end
    end

    def show
        @sucursal = Sucursal.find(params[:id])
        @horario = Horario.where(:sucursal_id => params[:id])
    end



    private

        def horario_params
            params.require(:horario).permit(:dia, :hora_inicio, :hora_fin, :sucursal_id)
        end


end