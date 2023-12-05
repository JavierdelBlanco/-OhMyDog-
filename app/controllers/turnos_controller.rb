class TurnosController < ApplicationController
  before_action :set_turno, only: %i[ show edit update destroy ]

  # GET /turnos or /turnos.json
  def index
    @turnos = Turno.all.order(fecha: :asc)
  end

  # GET /turnos/1 or /turnos/1.json
  def show
  end

  # GET /turnos/new
  def new
    @turno = Turno.new
  end

  # GET /turnos/1/edit
  def edit
  end

  # POST /turnos or /turnos.json
  def create
    nombres_perros = turno_params[:nombres_perros].reject(&:empty?)
    turnos_params = turno_params.except(:nombres_perros).merge(nombres_perros: nombres_perros)
    @turno = Turno.new(turnos_params)

    respond_to do |format|
      if @turno.save
        format.html { redirect_to turnos_url, notice: "Se ha enviado tu solicitud de turno correctamente" }
        format.json { render :show, status: :created, location: @turno }
      else
        flash[:alert] = "Fallo la solicitud de turno, usted ya cuenta con un turno para ese día"
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turnos/1 or /turnos/1.json
  def update
    respond_to do |format|
      if @turno.update(turno_params)
        format.html { redirect_to turnos_url, notice: "Turno was successfully updated." }
        format.json { render :show, status: :ok, location: @turno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turnos/1 or /turnos/1.json
  def destroy
    @turno.destroy!

    respond_to do |format|
      format.html { redirect_to turnos_url, notice: "Turno fue cancelado con exito." }
      format.json { head :no_content }
    end
  end

  def generar
    @turno = Turno.find(params[:id])
    @turno.estado = 'confirmado'
    @turno.fecha = params[:fecha]
    @turno.horario = params[:horario]
    @turno.detalle = params[:detalle]
    respond_to do |format|
      if @turno.save # Guardar el cambio en la base de datos
        TurnosMailer.notificar_turno_otorgado(@turno).deliver_later
        format.html { redirect_to turnos_url, notice: "El turno aprobado con éxito" }
      else
        format.html { redirect_to turnos_url, alert: "Hubo un problema al generar el turno" }
      end
    end
  end


  def rechazar
    @turno = Turno.find(params[:id])
    @turno.detalle = params[:detalle]
    # Serializar los atributos del turno
    turno_attributes = @turno.as_json

    # Enviar el ID y los atributos del turno al job
    TurnosMailer.notificar_turno_rechazado(turno_attributes).deliver_later

    respond_to do |format|
      if @turno.destroy
        format.html { redirect_to root_path, flash: { notice: "Turno rechazado con éxito." } }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, flash: { error: "Hubo un problema al rechazar el turno." } }
        format.json { render json: { error: "Hubo un problema al rechazar el turno." }, status: :unprocessable_entity }
      end
    end
  end

  def cancelar_veterinario
    @turno = Turno.find(params[:id])
    @turno.detalle = params[:detalle]
    @turno.estado = 'cancelado'

    turno_attributes = @turno.as_json


    respond_to do |format|
      if @turno.save
        TurnosMailer.notificar_turno_cancelado(turno_attributes).deliver_later
        format.html { redirect_to turnos_path, flash: { notice: "Turno cancelado con éxito." } }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, flash: { error: "Hubo un problema al cancelar el turno." } }
        format.json { render json: { error: "Hubo un problema al cancelar el turno." }, status: :unprocessable_entity }
      end
    end
  end

  def cancelar_cliente
    @turno = Turno.find(params[:id])
    @turno.estado = 'cancelado'

    turno_attributes = @turno.as_json


    respond_to do |format|
      if @turno.save
        format.html { redirect_to turnos_path, flash: { notice: "Turno cancelado con éxito." } }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, flash: { error: "Hubo un problema al cancelar el turno." } }
        format.json { render json: { error: "Hubo un problema al cancelar el turno." }, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turno
      @turno = Turno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turno_params
      params.require(:turno).permit(:nombre_cliente, :apellido_cliente, :email_cliente, :tipo_turno, :fecha, :franja_horaria ,:horario, :detalle, :estado, nombres_perros:[] )
    end
end
