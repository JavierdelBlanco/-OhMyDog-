class CuidadorPaseadorsController < ApplicationController
  before_action :set_cuidador_paseador, only: %i[ show edit update destroy ]

  # GET /cuidador_paseadors or /cuidador_paseadors.json
  def index
      if params[:tag]
        @cuidador_paseadors = CuidadorPaseador.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page])
      else
        @cuidador_paseadors = CuidadorPaseador.all.order(created_at: :desc).page(params[:page])
      end
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
        format.html { redirect_to cuidador_paseadors_url}
        flash[:notice] = "El cuidador/paseador fue cargado correctamente."
        format.json { render :show, status: :created, location: @cuidador_paseador }
      else
        flash[:alert] = "Falló la carga del cuidador/paseador."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cuidador_paseador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuidador_paseadors/1 or /cuidador_paseadors/1.json
  def update
    respond_to do |format|
      if @cuidador_paseador.update(cuidador_paseador_params)
        format.html { redirect_to cuidador_paseadors_url, notice: "El cuidador/paseador fue editado correctamente." }
        format.json { render :show, status: :ok, location: @cuidador_paseador }
      else
        flash[:alert] = "Falló la edicion del cuidador/paseador."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cuidador_paseador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuidador_paseadors/1 or /cuidador_paseadors/1.json
  def destroy
    @cuidador_paseador = CuidadorPaseador.find(params[:id]).destroy!

    respond_to do |format|
      format.html { redirect_to cuidador_paseadors_url, flash: { notice: "El cuidador/paseador fue eliminardo correctamente." } }
      format.json { head :no_content }
    end
  end

  def enviar_correo
    id = params[:id]
    @cuidador_paseador = CuidadorPaseador.find(id)
    @current_user = current_user
    CuidadorPaseadorsMailer.enviar_correo(@cuidador_paseador,@current_user).deliver_later
    respond_to do |format|
      format.html { redirect_to root_path, flash: { notice: "El correo fue enviado con exito a #{@cuidador_paseador.nombre}." } }
      format.json { head :no_content }
    end
  end


  def enviar_correo_no_registrado
    id = params[:id]
    @cuidador_paseador = CuidadorPaseador.find(id)
    nombre = params[:nombre]
    apellido = params[:apellido]
    direccion = params[:direccion]
    numero = params[:numero]
    email = params[:email]
    logger.info("Params: #{params.inspect}")
    # Corrige el acceso a los parámetros
    CuidadorPaseadorsMailer.enviar_correo_no_registrado(@cuidador_paseador, nombre, apellido, direccion, numero, email).deliver_later

    respond_to do |format|
      format.html { redirect_to root_path, flash: { notice: "El correo fue enviado con éxito a #{@cuidador_paseador.nombre}." } }
      format.json { redirect_to root_path, flash: { notice: "El correo fue enviado con éxito a #{@cuidador_paseador.nombre}." } }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuidador_paseador
      @cuidador_paseador = CuidadorPaseador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cuidador_paseador_params
      params.require(:cuidador_paseador).permit(:foto, :apellido, :nombre, :email, :telefono, :zona, :dias_horarios, :rol)
    end

end
