class PerrosEncontradosController < ApplicationController
  before_action :set_perros_encontrado, only: %i[ show edit update destroy ]


  # GET /perros_encontrados or /perros_encontrados.json
  def index
      @perros_encontrados = PerrosEncontrado.where(status: 'Se busca al dueño').order(created_at: :desc)
      @perros_reunidos = PerrosEncontrado.where(status: 'Dueño encontrado').order(created_at: :desc).limit(50)
  end


  def index_mis_perros_encontrado
    @perros_encontrados = PerrosEncontrado.where(mail: current_user.email).order(created_at: :desc)
  end


  # GET /perros_encontrados/1 or /perros_encontrados/1.json
  def show
  end


  # GET /perros_encontrados/new
  def new
    @perros_encontrado = PerrosEncontrado.new
    @perros_encontrado.status = "Se busca al dueño"
    @perros_encontrado.fecha_de_publicacion = Date.current
    @perros_encontrado.mail = current_user.email
  end


  # GET /perros_encontrados/1/edit
  def edit
  end


  # POST /perros_encontrados or /perros_encontrados.json
  def create
    @perros_encontrado = PerrosEncontrado.new(perros_encontrado_params)
    @perros_encontrado.action_type = 'create'
    respond_to do |format|
      if @perros_encontrado.save
        format.html { redirect_to perros_encontrados_path, notice: "La publicacion ha sido creada correctamente!" }
        format.json { render :show, status: :created, location: @perros_encontrado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perros_encontrado.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /perros_encontrados/1 or /perros_encontrados/1.json
  def update
    @perros_encontrado.action_type = 'update'
    respond_to do |format|
      if @perros_encontrado.update(perros_encontrado_params)
        format.html { redirect_to perros_encontrados_path, notice: "La publicacion ha sido editada correctamente!" }
        format.json { render :show, status: :ok, location: @perros_encontrado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perros_encontrado.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /perros_encontrados/1 or /perros_encontrados/1.json
  def destroy
    @perros_encontrado.destroy!


    respond_to do |format|
      format.html { redirect_to perros_encontrados_path, notice: "La publicacion ha sido eliminada correctamente" }
      format.json { head :no_content }
    end
  end


  def marcar_como_dueno_encontrado


    @perros_encontrado = PerrosEncontrado.find(params[:id])
    if @perros_encontrado.update(status: 'Dueño encontrado')
      redirect_to perros_encontrados_path, notice: 'El perro ha sido marcado como dueño encontrado.'
    else
      redirect_to perros_encontrados_path, alert: 'No se pudo marcar el perro como dueño encontrado.'
    end


  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perros_encontrado
      @perros_encontrado = PerrosEncontrado.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def perros_encontrado_params
      params.require(:perros_encontrado).permit(:nombre, :foto, :fecha_de_publicacion, :status, :mail, :descripcion)
    end
end
