class UsersController < ApplicationController
    load_and_authorize_resource class: 'Usuario'
    def index
        if params[:role].nil?
            @usuarios = Usuario.all
        else
            @usuarios = Usuario.where(:role => params[:role]) 
        end
    end

    def show
        @usuario = Usuario.find(params[:id])
    end

    def new
        @admin = params[:admin]
        @sucursales = Sucursal.all
        @usuario = Usuario.new
    end


    def create
        
        begin @usuario = Usuario.create({:nombre => params[:nombre], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :role => params[:role], :sucursal_id => params[:sucursal_id] })
            if @usuario.save 
                redirect_to users_path
            else
                flash[:notice] = @usuario.errors.messages
                render :new, status: :unprocessable_entity
            end
        rescue
            flash[:notice] = "El nombre ya esta en uso"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @edita_perfil = false
        @admin = params[:admin]
        @usuario = Usuario.find(params[:id])
    end

    def update
        @user = Usuario.find(params[:id])
        if @user.update(update_params)
            redirect_to usuario_path
         else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
         end
        
    end

    def edit_perfil
        @edita_perfil = true
        @role = current_usuario.role
        @usuario = Usuario.find(current_usuario.id)
        redirect_to "/users/#{current_usuario.id}/edit"
    end


    def destroy
        @usuario = Usuario.find(params[:id])
        if current_usuario.id != @usuario.id
            #Turno.eliminar_turnos(@usuario.id)
            Turno.eliminar_turnos(@usuario.id)
            @usuario.destroy
            flash[:notice] = "Se elimino con exito el cliente"
            redirect_to users_path
        else
            flash[:notice] = "No puedes eliminar tu cuenta!"
            redirect_to users_path
        end
    end


    private 
    def update_params
        params.require(:usuario).permit(:nombre, :email, :sucursal_id, :role)
    end

    def usuario_params
        params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation, :role, :sucursal_id)
    end

end