class GestionTurnosController < ApplicationController
  before_action :set_turno, only: %i[ show edit update destroy ]
  before_action :set_solicitud_turno, only: %i[ show edit update destroy ]
  before_action :validar_metodo_post, only: [:generar]

  # GET /turnos or /turnos.json
  def index
    @turnos = Turno.all.order(dia: :asc)
    @solicitud_turnos = SolicitudTurno.all.order(dia: :asc)
  end

  def generar
    @solicitud_turno = SolicitudTurno.find(params[:id])

    dia = params[:dia]
    horario = params[:horario]
    descripcion = params[:descripcion]

    @turno = Turno.new(
      nombre_cliente: @solicitud_turno.nombre_cliente,
      apellido_cliente: @solicitud_turno.apellido_cliente,
      email_cliente: @solicitud_turno.email_cliente,
      nombres_perros: @solicitud_turno.nombres_perros,
      tipo_turno: @solicitud_turno.tipo_turno,
      dia: dia,
      horario: horario,
      descripcion: descripcion
    )

    respond_to do |format|
      if @turno.save
        @solicitud_turno.destroy!  # Aquí eliminamos la solicitud de turno después de guardar el turno
        GestionTurnosMailer.notificar_turno_otorgado(@turno).deliver_later
        format.html { redirect_to gestion_turnos_url, notice: "Turno was successfully created." }
        format.json { render :show, status: :created, location: @turno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_turno
      @turno = Turno.find(params[:id])
    end

    def set_solicitud_turno
      @solicitud_turno = SolicitudTurno.find(params[:id])
    end

    def turno_params
      params.require(:turno).permit(:nombre_cliente, :apellido_cliente, :email_cliente, :nombres_perros, :tipo_turno, :dia, :horario, :descripcion)
    end

    def solicitud_turno_params
      params.require(:solicitud_turno).permit(:nombre_cliente, :apellido_cliente, :email_cliente, :tipo_turno, :dia, :horario, :descripcion, nombres_perros: [])
    end

    def validar_metodo_post
      head :forbidden unless request.post?
    end
end
