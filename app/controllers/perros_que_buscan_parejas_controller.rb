class PerrosQueBuscanParejasController < ApplicationController
  before_action :set_perros_que_buscan_pareja, only: %i[ show edit update destroy ]
  include PerrosQueBuscanParejasHelper

  # GET /perros_que_buscan_parejas or /perros_que_buscan_parejas.json
  def index
    @perros_que_buscan_parejas = PerrosQueBuscanPareja.where(user_id: current_user.id, fallecido: false).order(postulado: :desc)
  end

  # GET /perros_que_buscan_parejas/1 or /perros_que_buscan_parejas/1.json
  def show
  end

  # GET /perros_que_buscan_parejas/new
  def new
    @perros_que_buscan_pareja = PerrosQueBuscanPareja.new
  end

  # GET /perros_que_buscan_parejas/1/edit
  def edit
  end

  # POST /perros_que_buscan_parejas or /perros_que_buscan_parejas.json
  def create
    @perros_que_buscan_pareja = PerrosQueBuscanPareja.new(perros_que_buscan_pareja_params)

    respond_to do |format|
      if @perros_que_buscan_pareja.save
        format.html { redirect_to perros_que_buscan_pareja_url(@perros_que_buscan_pareja), notice: "Perros que buscan pareja was successfully created." }
        format.json { render :show, status: :created, location: @perros_que_buscan_pareja }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perros_que_buscan_pareja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perros_que_buscan_parejas/1 or /perros_que_buscan_parejas/1.json
  def update
    respond_to do |format|
      if @perros_que_buscan_pareja.update(perros_que_buscan_pareja_params)
        format.html { redirect_to perros_que_buscan_parejas_path, notice: "Perros que buscan pareja was successfully updated." }
        format.json { render :show, status: :ok, location: @perros_que_buscan_pareja }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perros_que_buscan_pareja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perros_que_buscan_parejas/1 or /perros_que_buscan_parejas/1.json
  def destroy
    @perros_que_buscan_pareja.destroy!

    respond_to do |format|
      format.html { redirect_to perros_que_buscan_parejas_url, notice: "Perros que buscan pareja was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # En tu controlador o un archivo de ayuda
  def calcular_edad(dia, mes, año)
    fecha_nacimiento = Date.new(año, mes, dia)
    fecha_actual = Date.current
    edad = fecha_actual.year - fecha_nacimiento.year - (fecha_actual.month > fecha_nacimiento.month || (fecha_actual.month == fecha_nacimiento.month && fecha_actual.day >= fecha_nacimiento.day) ? 0 : 1)
    edad.positive? ? edad : 0
  end

  def postular
    @perro = PerrosQueBuscanPareja.find(params[:id])

    # Actualizar los datos del perro con los ingresados en el formulario
    @perro.update(perros_que_buscan_pareja_params)

    # Cambiar el estado de postulado a true
    @perro.update(postulado: true)

    # Redirigir a la página de detalles del perro
    redirect_to perros_que_buscan_parejas_path, notice: "Perro postulado correctamente."
  end

  def retirar
    @perro = PerrosQueBuscanPareja.find(params[:id])

    # Cambiar el estado de postulado a true
    @perro.update(postulado: false)

    # Redirigir a la página de detalles del perro
    redirect_to perros_que_buscan_parejas_path, notice: "Perro retirado correctamente."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perros_que_buscan_pareja
      @perros_que_buscan_pareja = PerrosQueBuscanPareja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perros_que_buscan_pareja_params
      params.require(:perros_que_buscan_pareja).permit(:nombre, :fecha_de_nacimiento, :raza, :sexo, :caracteristicas, :condiciones, :tamano, :color, :foto, :descripcion, :fecha_celo_inicio)
    end
end
