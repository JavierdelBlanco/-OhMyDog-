class DesparasitacionsController < ApplicationController
  before_action :set_desparasitacion, only: %i[ show edit update destroy ]

  # GET /desparasitacions or /desparasitacions.json
  def index
    @desparasitacions = Desparasitacion.all
  end

  # GET /desparasitacions/1 or /desparasitacions/1.json
  def show
  end

  # GET /desparasitacions/new
  def new
    @desparasitacion = Desparasitacion.new
  end

  # GET /desparasitacions/1/edit
  def edit
  end

  # POST /desparasitacions or /desparasitacions.json
  def create
    @desparasitacion = Desparasitacion.new(desparasitacion_params)

    respond_to do |format|
      if @desparasitacion.save
        format.html { redirect_to desparasitacion_url(@desparasitacion), notice: "Desparasitacion was successfully created." }
        format.json { render :show, status: :created, location: @desparasitacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @desparasitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desparasitacions/1 or /desparasitacions/1.json
  def update
    respond_to do |format|
      if @desparasitacion.update(desparasitacion_params)
        format.html { redirect_to desparasitacion_url(@desparasitacion), notice: "Desparasitacion was successfully updated." }
        format.json { render :show, status: :ok, location: @desparasitacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @desparasitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desparasitacions/1 or /desparasitacions/1.json
  def destroy
    @desparasitacion.destroy!

    respond_to do |format|
      format.html { redirect_to desparasitacions_url, notice: "Desparasitacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desparasitacion
      @desparasitacion = Desparasitacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def desparasitacion_params
      params.require(:desparasitacion).permit(:historia_c_id, :dia, :mes, :anio, :producto, :lote, :dosis, :detalle)
    end
end
