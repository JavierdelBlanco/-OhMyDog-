class VacunaRsController < ApplicationController
  before_action :set_vacuna_r, only: %i[ show edit update destroy ]

  # GET /vacuna_rs or /vacuna_rs.json
  def index
    @vacuna_rs = VacunaR.all
  end

  # GET /vacuna_rs/1 or /vacuna_rs/1.json
  def show
  end

  # GET /vacuna_rs/new
  def new
    @vacuna_r = VacunaR.new
  end

  # GET /vacuna_rs/1/edit
  def edit
  end

  # POST /vacuna_rs or /vacuna_rs.json
  def create
    @vacuna_r = VacunaR.new(vacuna_r_params)

    respond_to do |format|
      if @vacuna_r.save
        format.html { redirect_to vacuna_r_url(@vacuna_r), notice: "Vacuna r was successfully created." }
        format.json { render :show, status: :created, location: @vacuna_r }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacuna_r.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacuna_rs/1 or /vacuna_rs/1.json
  def update
    respond_to do |format|
      if @vacuna_r.update(vacuna_r_params)
        format.html { redirect_to vacuna_r_url(@vacuna_r), notice: "Vacuna r was successfully updated." }
        format.json { render :show, status: :ok, location: @vacuna_r }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacuna_r.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacuna_rs/1 or /vacuna_rs/1.json
  def destroy
    @vacuna_r.destroy!

    respond_to do |format|
      format.html { redirect_to vacuna_rs_url, notice: "Vacuna r was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacuna_r
      @vacuna_r = VacunaR.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacuna_r_params
      params.require(:vacuna_r).permit(:historia_c_id, :dia, :mes, :anio, :tipo, :lote, :dosis, :detalle, :marca)
    end
end
