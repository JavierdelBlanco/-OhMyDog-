class AmbulatoriaController < ApplicationController
  before_action :set_ambulatorium, only: %i[ show edit update destroy ]

  # GET /ambulatoria or /ambulatoria.json
  def index
    @ambulatoria = Ambulatorium.all
  end

  # GET /ambulatoria/1 or /ambulatoria/1.json
  def show
  end

  # GET /ambulatoria/new
  def new
    @ambulatorium = Ambulatorium.new
  end

  # GET /ambulatoria/1/edit
  def edit
  end

  # POST /ambulatoria or /ambulatoria.json
  def create
    @ambulatorium = Ambulatorium.new(ambulatorium_params)

    respond_to do |format|
      if @ambulatorium.save
        format.html { redirect_to ambulatorium_url(@ambulatorium), notice: "Ambulatorium was successfully created." }
        format.json { render :show, status: :created, location: @ambulatorium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ambulatorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ambulatoria/1 or /ambulatoria/1.json
  def update
    respond_to do |format|
      if @ambulatorium.update(ambulatorium_params)
        format.html { redirect_to ambulatorium_url(@ambulatorium), notice: "Ambulatorium was successfully updated." }
        format.json { render :show, status: :ok, location: @ambulatorium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ambulatorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ambulatoria/1 or /ambulatoria/1.json
  def destroy
    @ambulatorium.destroy!

    respond_to do |format|
      format.html { redirect_to ambulatoria_url, notice: "Ambulatorium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ambulatorium
      @ambulatorium = Ambulatorium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ambulatorium_params
      params.require(:ambulatorium).permit(:historia_c_id, :dia, :mes, :anio, :sintomas, :diagnostico, :tratamiento, :detalles)
    end
end
