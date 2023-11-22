class CastracionsController < ApplicationController
  before_action :set_castracion, only: %i[ show edit update destroy ]

  # GET /castracions or /castracions.json
  def index
    @castracions = Castracion.all
  end

  # GET /castracions/1 or /castracions/1.json
  def show
  end

  # GET /castracions/new
  def new
    @castracion = Castracion.new
    @perrito = Perrito.find(params[:id])
  end

  # GET /castracions/1/edit
  def edit
  end

  # POST /castracions or /castracions.json
  def create
    parametros = castracion_params.except(:perrito_id)
    @castracion = Castracion.new(parametros)
    perro_id = params[:castracion][:perrito_id]
    @perrito = Perrito.find(perro_id)
    
    if(!@perrito.historia_c.castracion)
      @perrito.historia_c.castracion = @castracion
      @perrito.save
      respond_to do |format|
        if @castracion.save
          puts '################################'
          puts 'SE GUARDO LA CASTRACION'
          format.html { redirect_to ver_perrito_path(@perrito), notice: "Se registró la castración con éxito." }
          format.json { render :show, status: :created, location: @castracion }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @castracion.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = 'El perro ya ha sido castrado'
      redirect_to ver_perrito_path(@perrito)
    end
  end

  # PATCH/PUT /castracions/1 or /castracions/1.json
  def update
    respond_to do |format|
      if @castracion.update(castracion_params)
        format.html { redirect_to castracion_url(@castracion), notice: "Castracion was successfully updated." }
        format.json { render :show, status: :ok, location: @castracion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @castracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castracions/1 or /castracions/1.json
  def destroy
    @castracion.destroy!

    respond_to do |format|
      format.html { redirect_to castracions_url, notice: "Castracion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castracion
      @castracion = Castracion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def castracion_params
      params.require(:castracion).permit(:historia_c_id, :dia, :mes, :anio, :detalle, :perrito_id)
    end
end
