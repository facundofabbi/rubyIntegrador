class TurnosController < ApplicationController
    def index
        begin
            @estado = params[:estado]
            if current_usuario.role == "Personal Bancario"
                @turnos = Turno.where(:estado => params[:estado], :sucursal_id => current_usuario.sucursal_id)
            else
                @turnos = Turno.where(:estado => params[:estado], :cliente_id => current_usuario.id)
            end
        rescue
            @turnos = Turno.all
        end
    end

    def show
        @turno = Turno.find(params[:id])
    end

    def edit
        @turno = Turno.find(params[:id])
        @sucursal = Turno.find(params[:id]).sucursal
    end

    def update
        @turno = Turno.find(params[:id])
        begin 
            if Sucursal.chequear_turno(I18n.l(Date.parse(params[:turno][:fecha].to_s),format: '%A'),params[:turno][:hora],params[:turno][:sucursal_id])
                if @turno.update(turno_params)
                    redirect_to turnos_path
                else
                    flash[:notice] = @turno.errors.messages
                    redirect_to "/turnos/#{@turno.id}/edit"
                end
            else
                flash[:notice] = "La fecha y hora seleccionada no coincide con los horarios de atencion de la sucursal"
                redirect_to "/turnos/#{@turno.id}/edit"
            end
        rescue
            flash[:notice] = "Por favor ingrese una fecha valida"
            redirect_to "/turnos/#{@turno.id}/edit"
        end
    end

    def new
        @cliente_id = current_usuario.id
        @sucursal = Sucursal.find(params[:id])
        @turno = Turno.new
    end

    def create
        begin 
            if Sucursal.chequear_turno(I18n.l(Date.parse(params[:turno][:fecha].to_s),format: '%A'),params[:turno][:hora],params[:turno][:sucursal_id])
                @turno = Turno.new(turno_params)
                @turno.cliente_id = current_usuario.id
                if @turno.save
                    flash[:notice] = "Se ah creado con exito el turno"
                    redirect_to sucursals_turnos_path
                else
                    flash[:notice] = @turno.errors.messages
                    redirect_to new_turno_path(params[:turno][:sucursal_id])
                end
            else
                flash[:notice] = "La fecha y hora seleccionada no coincide con los horarios de atencion de la sucursal"
                redirect_to new_turno_path(params[:turno][:sucursal_id])
            end
        rescue
            flash[:notice] = "Por favor ingrese una fecha valida"
            redirect_to new_turno_path(params[:turno][:sucursal_id])
        end
    end

    def destroy
        @turno = Turno.find(params[:id])
        @turno.destroy
        redirect_to turnos_path(estado: "Pendiente")
    end

    private

    def turno_params
        params.require(:turno).permit(:sucursal_id, :fecha, :hora, :motivo, :estado)
    end
end