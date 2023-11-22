class SolicitudTurnosController < ApplicationController
  before_action :set_solicitud_turno, only: %i[ show edit update destroy ]

  # GET /solicitud_turnos or /solicitud_turnos.json
  def index
    @solicitud_turnos = SolicitudTurno.all
  end

  # GET /solicitud_turnos/1 or /solicitud_turnos/1.json
  def show
  end

  # GET /solicitud_turnos/new
  def new
    @solicitud_turno = SolicitudTurno.new
  end

  # GET /solicitud_turnos/1/edit
  def edit
  end

  # POST /solicitud_turnos or /solicitud_turnos.json
  def create
    nombres_perros = solicitud_turno_params[:nombres_perros].reject(&:empty?)
    solicitud_params = solicitud_turno_params.except(:nombres_perros).merge(nombres_perros: nombres_perros)

    @solicitud_turno = SolicitudTurno.new(solicitud_params)

    respond_to do |format|
      if @solicitud_turno.save
        format.html { redirect_to gestion_turnos_url, notice: "Solicitud turno was successfully created." }
        format.json { render :show, status: :created, location: @solicitud_turno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @solicitud_turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitud_turnos/1 or /solicitud_turnos/1.json
  def update
    respond_to do |format|
      if @solicitud_turno.update(solicitud_turno_params)
        format.html { redirect_to gestion_turnos_url, notice: "Solicitud turno was successfully updated." }
        format.json { render :show, status: :ok, location: @solicitud_turno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @solicitud_turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitud_turnos/1 or /solicitud_turnos/1.json
  def destroy
    @solicitud_turno.destroy!

    respond_to do |format|
      format.html { redirect_to gestion_turnos_url, notice: "Solicitud turno was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud_turno
      @solicitud_turno = SolicitudTurno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solicitud_turno_params
      params.require(:solicitud_turno).permit(:nombre_cliente, :apellido_cliente, :email_cliente, :tipo_turno, :dia, :horario, :descripcion, nombres_perros:[] )
    end
end
