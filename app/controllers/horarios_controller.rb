class HorariosController < ApplicationController
    def new
        @horarios = Horario.new
        @sucursal = Sucursal.find(params[:id])
    end

    def create
        @horario = Horario.new({:dia => params[:dia], :hora_inicio => params[:hora_inicio], :hora_fin => params[:hora_fin], :sucursal_id => params[:sucursal_id] })
        begin
            if @horario.save
                redirect_to sucursals_path
            else
                flash[:notice] = @horario.errors.messages
                redirect_to "/sucursals/#{params[:id]}/horarios/new"
            end
        rescue
            flash[:notice] = "Ya existe horarios para ese dia. Recuerda que solo se puede agregar un horario por dia!"
            redirect_to "/sucursals/#{params[:id]}/horarios/new"
        end
    end

    def show
        @sucursal = Sucursal.find(params[:id])
        @horario = Horario.where(:sucursal_id => params[:id])
    end

    def edit
        @horario = Horario.find(params[:id])
    end

    def update
        @horario = Horario.find(params[:id])
        if @horario.update(horario_params)
            redirect_to sucursals_path
        else
            flash[:notice] = @horario.errors.messages
            redirect_to "/sucursals/#{@horario.id}/horarios/edit"
        end
    end

    private

        def horario_params
            params.require(:horario).permit(:dia, :hora_inicio, :hora_fin, :sucursal_id)
        end


end