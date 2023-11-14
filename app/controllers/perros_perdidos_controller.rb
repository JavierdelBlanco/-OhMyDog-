class PerrosPerdidosController < ApplicationController
  before_action :set_perros_perdido, only: %i[ update show edit destroy ]

  # GET /perros_perdidos or /perros_perdidos.json
  def index
    if params[:tag]
      perros_perdidos = PerrosPerdido.where(status: 'Se busca').tagged_with(params[:tag]).order(created_at: :desc)
      perros_encontrados = PerrosPerdido.where(status: 'Encontrado').tagged_with(params[:tag]).order(created_at: :desc)
    else
      perros_perdidos = PerrosPerdido.where(status: 'Se busca').order(created_at: :desc)
      perros_encontrados = PerrosPerdido.where(status: 'Encontrado').order(created_at: :desc)
    end

    @perros = (perros_perdidos + perros_encontrados).sort_by { |perro| [perro.status, perro.created_at] }.reverse
    @perros = Kaminari.paginate_array(@perros).page(params[:page]).per(6)

    @users = User.all
  end


  # GET /perros_perdidos/1 or /perros_perdidos/1.json
  def show
  end

  # GET /perros_perdidos/new
  def new
    @perros_perdido = PerrosPerdido.new
  end

  # GET /perros_perdidos/1/edit
  def edit
  end

  # POST /perros_perdidos or /perros_perdidos.json
  def create
    @perros_perdido = PerrosPerdido.new(perros_perdido_params)
    @perros_perdido.action_type = 'create'
    respond_to do |format|
      if @perros_perdido.save
        format.html { redirect_to perros_perdidos_path}
        flash[:notice] = "El perro se ha publicado exitosamente."
        format.json { render :show, status: :created, location: @perros_perdido }
      else
        flash[:alert] = "Falló la publicacion del perro."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perros_perdido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perros_perdidos/1 or /perros_perdidos/1.json
  def update
    @perros_perdido.action_type = 'update'
    respond_to do |format|
      if @perros_perdido.update(perros_perdido_params)
        format.html { redirect_to perros_perdidos_path, notice: "La publicación ha sido editada correctamente!" }
        format.json { render :show, status: :ok, location: @perros_perdido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perros_perdido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perros_perdidos/1 or /perros_perdidos/1.json
  def destroy
    @perros_perdido.destroy!

    respond_to do |format|
      format.html { redirect_to perros_perdidos_path, notice: "La publicacion ha sido eliminada correctamente!" }
      format.json { head :no_content }
    end
  end

  def marcar_como_encontrado

    @perros_perdido = PerrosPerdido.find(params[:id])
    if @perros_perdido.update(status: 'Encontrado')
      redirect_to perros_perdidos_path, notice: 'El perro ha sido marcado como encontrado.'
    else
      redirect_to perros_perdidos_path, alert: 'No se pudo marcar el perro como encontrado.'
    end

  end

  def enviar_correo_perros_perdidos

    id = params[:id]
    @perro = PerrosPerdido.find(id)

    @owner = User.find_by(email: @perro.mail)

    @current_user = current_user

    PerrosPerdidosMailer.enviar_correo_perros_perdidos(@perro, @owner, @current_user).deliver_later

    respond_to do |format|
      format.html { redirect_to root_path, flash: { notice: "El correo fue enviado con exito." } }
      format.json { head :no_content }
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perros_perdido
      @perros_perdido = PerrosPerdido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perros_perdido_params
      params.require(:perros_perdido).permit(:nombre, :foto, :fecha_de_publicacion, :status, :descripcion, :mail)
    end



end
