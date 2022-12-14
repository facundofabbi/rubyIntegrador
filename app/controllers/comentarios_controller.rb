class ComentariosController < ApplicationController
    def new
        @comentario = Comentario.new
        @personal_id = current_usuario.id
        @turno = params[:id]
    end

    def create
        @comentario =  Comentario.new({:texto => params[:texto], :personal_id => params[:personal_id], :turno_id => params[:turno_id] })
        if @comentario.save
            Turno.cargar_personal_y_estado(params[:personal_id], params[:turno_id] )
            flash[:notice] = "El comentario se agrego con exito!"
            redirect_to turnos_path(estado: "Pendiente")
        else
            flash[:notice] = "Por favor ingrese un comentario"
            redirect_to new_comentario_path(params[:turno_id])
        end
    end

    def show
        @comentario = Comentario.where(:turno_id => params[:id]).first
        @personal = Usuario.find(@comentario.personal_id)
    end



    private

        def comentario_params
            params.require(:horario).permit(:texto, :personal_id, :turno_id)
        end


end