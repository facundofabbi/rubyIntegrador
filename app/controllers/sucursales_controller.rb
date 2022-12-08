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

    def destroy
        @sucursal = Sucursal.find(params[:id])
        #@usuarios = Sucursal.find(params[:id]).usuarios
        if Sucursal.chequear_eliminar(params[:id])
            @sucursal.destroy
        end
        redirect_to sucursales_path
    end


    def edit
        
    end

    def update
        @sucu = Sucursal.find(params[:id])
        begin @sucu.update({:nombre => params[:nombre], :direccion => params[:direccion], :telefono => params[:telefono] })
            redirect_to sucursals_path
        rescue
            flash[:errors] = @sucu.errors.full_messages
            redirect_to "/sucursales/#{@sucu.id}/edit"
         end
        
    end

    private
        def sucursal_params
            params.require(:sucursal).permit(:nombre, :direccion, :telefono)
        end


end