class HistoriaCsController < ApplicationController
  before_action :set_historia_c, only: %i[ show edit update destroy ]

  # GET /historia_cs or /historia_cs.json
  def index
    @historia_cs = HistoriaC.all
  end

  # GET /historia_cs/1 or /historia_cs/1.json
  def show
  end

  # GET /historia_cs/new
  def new
    @historia_c = HistoriaC.new
  end

  # GET /historia_cs/1/edit
  def edit
  end

  # POST /historia_cs or /historia_cs.json
  def create
    @historia_c = HistoriaC.new(historia_c_params)

    respond_to do |format|
      if @historia_c.save
        format.html { redirect_to historia_c_url(@historia_c), notice: "Historia c was successfully created." }
        format.json { render :show, status: :created, location: @historia_c }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historia_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historia_cs/1 or /historia_cs/1.json
  def update
    respond_to do |format|
      if @historia_c.update(historia_c_params)
        format.html { redirect_to historia_c_url(@historia_c), notice: "Historia c was successfully updated." }
        format.json { render :show, status: :ok, location: @historia_c }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historia_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historia_cs/1 or /historia_cs/1.json
  def destroy
    @historia_c.destroy!

    respond_to do |format|
      format.html { redirect_to historia_cs_url, notice: "Historia c was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_c
      @historia_c = HistoriaC.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historia_c_params
      params.require(:historia_c).permit(:perrito_id, :castracion_id, :vacuna_e_id, :vacuna_r_id, :desparasitacion_id, :ambulatorium_id)
    end
end
