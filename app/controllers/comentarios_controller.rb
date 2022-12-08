class ComentariosController < ApplicationController
    def new
        @comentario = Comentario.new
        @personal_id = current_usuario.id
        @turno = params[:id]
    end

    def create
        @comentario =  Comentario.new({:texto => params[:texto], :personal_id => params[:personal_id], :turno_id => params[:turno_id] })
        pp "SAAAAAAAAAAAAAAAAA",params
        if @comentario.save
            Turno.cargar_personal_y_estado(params[:personal_id], params[:turno_id] )
            redirect_to turnos_path(estado: "Pendiente")
        else
            render :new 
        end
    end

    def show

        @comentario = Comentario.where(:turno_id => params[:id]).first
        @personal = Usuario.find(@comentario.personal_id)
        
        pp "ESTE ES EL COMENTARIO", @comentario.turno_id
    end



    private

        def comentario_params
            params.require(:horario).permit(:texto, :personal_id, :turno_id)
        end


end