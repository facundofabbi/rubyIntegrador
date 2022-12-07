class SucursalesController < ApplicationController
    def index
        @sucursales = Sucursal.all
    end

    def show
        @sucursal = Sucursal.find(params[:id])
    end

    def new
        @sucursal = Sucursal.new
    end

    def index_turno
        @sucursales = Sucursal.all
    end


    def create
        @sucursal = Sucursal.new({:nombre => params[:nombre], :direccion => params[:direccion], :telefono => params[:telefono] })
        if @sucursal.save
            redirect_to sucursales_path
        else
            render :new
        end
    end


    private
        def sucursal_params
            params.require(:sucursal).permit(:nombre, :direccion, :telefono)
        end
end