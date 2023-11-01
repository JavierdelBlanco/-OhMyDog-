class CuidadorPaseadorsController < ApplicationController
  before_action :set_cuidador_paseador, only: %i[ show edit update destroy ]

  # GET /cuidador_paseadors or /cuidador_paseadors.json
  def index
    @cuidador_paseadors = CuidadorPaseador.all
  end

  # GET /cuidador_paseadors/1 or /cuidador_paseadors/1.json
  def show
  end

  # GET /cuidador_paseadors/new
  def new
    @cuidador_paseador = CuidadorPaseador.new
  end

  # GET /cuidador_paseadors/1/edit
  def edit
  end

  # POST /cuidador_paseadors or /cuidador_paseadors.json
  def create
    @cuidador_paseador = CuidadorPaseador.new(cuidador_paseador_params)

    respond_to do |format|
      if @cuidador_paseador.save
        format.html { redirect_to cuidador_paseadors_url, notice: "Cuidador paseador was successfully created." }
        format.json { render :show, status: :created, location: @cuidador_paseador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cuidador_paseador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuidador_paseadors/1 or /cuidador_paseadors/1.json
  def update
    respond_to do |format|
      if @cuidador_paseador.update(cuidador_paseador_params)
        format.html { redirect_to cuidador_paseadors_url, notice: "Cuidador/paseador was successfully updated." }
        format.json { render :show, status: :ok, location: @cuidador_paseador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cuidador_paseador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuidador_paseadors/1 or /cuidador_paseadors/1.json
  def destroy
    @cuidador_paseador.destroy!

    respond_to do |format|
      format.html { redirect_to cuidador_paseadors_url, notice: "Cuidador/paseador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuidador_paseador
      @cuidador_paseador = CuidadorPaseador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cuidador_paseador_params
      params.require(:cuidador_paseador).permit(:foto, :apellido, :nombre, :horarios, :rol)
    end
end
