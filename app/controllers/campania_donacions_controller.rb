class CampaniaDonacionsController < ApplicationController
  before_action :set_campania_donacion, only: %i[ show edit update destroy ]

  # GET /campania_donacions or /campania_donacions.json
  def index
    @campania_donacions = CampaniaDonacion.all
  end

  # GET /campania_donacions/1 or /campania_donacions/1.json
  def show
  end

  # GET /campania_donacions/new
  def new
    @campania_donacion = CampaniaDonacion.new
  end

  # GET /campania_donacions/1/edit
  def edit
  end

  # POST /campania_donacions or /campania_donacions.json
  def create
    @fecha = Date.parse(params[:campania_donacion][:fecha])
    params = campania_donacion_params.except(:fecha)
    @campania_donacion = CampaniaDonacion.new(params)
    @campania_donacion.dia_limite = @fecha.day
    @campania_donacion.mes_limite = @fecha.month
    @campania_donacion.anio_limite = @fecha.year

    respond_to do |format|
      if @campania_donacion.save
        format.html { redirect_to ver_campanias_path, notice: "Se cargó la campaña correctamente." }
        format.json { render :show, status: :created, location: @campania_donacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campania_donacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campania_donacions/1 or /campania_donacions/1.json
  def update
    @fecha = Date.parse(params[:campania_donacion][:fecha])
    params = campania_donacion_params.except(:fecha)
    @campania_donacion.dia_limite = @fecha.day
    @campania_donacion.mes_limite = @fecha.month
    @campania_donacion.anio_limite = @fecha.year
    respond_to do |format|
      if @campania_donacion.update(params)
        format.html { redirect_to ver_campanias_path, notice: "Se actualizó la campaña exitosamente." }
        format.json { render :show, status: :ok, location: @campania_donacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campania_donacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campania_donacions/1 or /campania_donacions/1.json
  def destroy
    @campania_donacion.destroy!

    respond_to do |format|
      format.html { redirect_to ver_campanias_path, notice: "Se eliminó la campaña." }
      format.json { head :no_content }
    end
  end

  def ver
    @campanias = CampaniaDonacion.all
  end

  def cargar
    @campania_donacion = CampaniaDonacion.new
  end

  def editar
    @campania_donacion = CampaniaDonacion.find(params[:id])
    @fecha = Date.new(@campania_donacion.anio_limite, @campania_donacion.mes_limite, @campania_donacion.dia_limite)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campania_donacion
      @campania_donacion = CampaniaDonacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campania_donacion_params
      params.require(:campania_donacion).permit(:nombre, :motivo, :beneficiario, :monto_total, :monto_actual, :dia_limite, :mes_limite, :anio_limite, :imagen, :fecha)
    end
end
