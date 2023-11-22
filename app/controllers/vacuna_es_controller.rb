class VacunaEsController < ApplicationController
  before_action :set_vacuna_e, only: %i[ show edit update destroy ]

  # GET /vacuna_es or /vacuna_es.json
  def index
    @vacuna_es = VacunaE.all
  end

  # GET /vacuna_es/1 or /vacuna_es/1.json
  def show
  end

  # GET /vacuna_es/new
  def new
    @vacuna_e = VacunaE.new
  end

  # GET /vacuna_es/1/edit
  def edit
  end

  # POST /vacuna_es or /vacuna_es.json
  def create
    @vacuna_e = VacunaE.new(vacuna_e_params)

    respond_to do |format|
      if @vacuna_e.save
        format.html { redirect_to vacuna_e_url(@vacuna_e), notice: "Vacuna e was successfully created." }
        format.json { render :show, status: :created, location: @vacuna_e }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacuna_e.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacuna_es/1 or /vacuna_es/1.json
  def update
    respond_to do |format|
      if @vacuna_e.update(vacuna_e_params)
        format.html { redirect_to vacuna_e_url(@vacuna_e), notice: "Vacuna e was successfully updated." }
        format.json { render :show, status: :ok, location: @vacuna_e }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacuna_e.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacuna_es/1 or /vacuna_es/1.json
  def destroy
    @vacuna_e.destroy!

    respond_to do |format|
      format.html { redirect_to vacuna_es_url, notice: "Vacuna e was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacuna_e
      @vacuna_e = VacunaE.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacuna_e_params
      params.require(:vacuna_e).permit(:historia_c_id, :dia, :mes, :anio, :tipo, :lote, :dosis, :detalle, :marca)
    end
end
