class UsersController < ApplicationController
    def index
        @usuarios = Usuario.all
    end

    def show
        @usuario = Usuario.find(params[:id])
    end

    def new 
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.create!({:nombre => params[:nombre], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :role => params[:role] })
        if @usuario.save 
            redirect_to users_path
        else
            render :new
        end
    end

    def edit
        @edita_perfil = false
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




    private 
    def update_params
        params.require(:usuario).permit(:nombre, :email, :role)
    end

    def usuario_params
        params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation, :role)
    end

end