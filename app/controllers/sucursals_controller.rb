class SucursalsController < ApplicationController
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
            redirect_to sucursals_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @sucursal = Sucursal.find(params[:id])
        #@usuarios = Sucursal.find(params[:id]).usuarios
        if Sucursal.chequear_eliminar(params[:id])
            Comentario.eliminar_comentarios(@sucursal)
            @sucursal.destroy
            redirect_to sucursals_path, notice: "La sucursal ah sido editada con exito!!"
        else
            redirect_to sucursals_path, notice: "La sucursal que intentas eliminar tiene turno y/o personal asignados en la misma. Por favor eliminelos antes de eliminar la sucursal"
        end
    end


    def edit
        @sucursal = Sucursal.find(params[:id])
    end

    def update
        @sucu = Sucursal.find(params[:id])
        if @sucu.update(sucursal_params)
            redirect_to sucursals_path, notice: "La sucursal ah sido editada con exito!!"
        else
            flash[:notice] = @sucu.errors.messages
            redirect_to edit_sucursal_path
         end
        
    end

    private
        def sucursal_params
            params.require(:sucursal).permit(:nombre, :direccion, :telefono)
        end


end