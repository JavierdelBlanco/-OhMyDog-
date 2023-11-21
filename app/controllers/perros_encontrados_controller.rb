class PerrosEncontradosController < ApplicationController
  before_action :set_perros_encontrado, only: %i[ show edit update destroy ]


  # GET /perros_encontrados or /perros_encontrados.json
  def index

    @all_dogs = PerrosEncontrado.all

    if params[:filter].present?
      perros_encontrados = PerrosEncontrado.where(mail: params[:filter], status: 'Se busca al dueño').order(created_at: :desc)
      perros_reunidos = PerrosEncontrado.where(mail: params[:filter], status: 'Dueño encontrado').limit(50).order(created_at: :desc)

      # Combinar perros perdidos y encontrados
      @perros = perros_encontrados + perros_reunidos

      # Ordenar la lista combinada por status y fecha de forma descendente
      @perros = @perros.sort_by { |perro| [perro.status.downcase, perro.created_at] }.reverse

      # Aplicar paginación a la lista
      @perros = Kaminari.paginate_array(@perros).page(params[:page]).per(3)
    else
      perros_encontrados = PerrosEncontrado.where(status: 'Se busca al dueño').order(created_at: :desc)
      perros_reunidos = PerrosEncontrado.where(status: 'Dueño encontrado').limit(50).order(created_at: :desc)

      # Combinar perros perdidos y encontrados
      @perros = perros_encontrados + perros_reunidos

      # Ordenar la lista combinada por status y fecha de forma descendente
      @perros = @perros.sort_by { |perro| [perro.status.downcase, perro.created_at] }.reverse

      # Aplicar paginación a la lista
      @perros = Kaminari.paginate_array(@perros).page(params[:page]).per(3)
    end

    @users = User.all

    #respond_to do |format|
    #  format.turbo_stream
    #  format.html
    #end

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
  end


  # GET /perros_encontrados/1/edit
  def edit
  end

  # app/controllers/perros_encontrados_controller.rb
def edit_no_registrado
  identificador = params[:identificador]
  @perros_encontrado = PerrosEncontrado.find_by(token: identificador)

  if @perros_encontrado
    if @perros_encontrado.status == 'Se busca al dueño'
      render :edit
    else
      redirect_to root_path, notice: "Esta publicacion ha sido marcada como dueño encontrado."
    end
  else
    redirect_to root_path, alert: "No se encontró un perro con este identificador."
  end
end


  #def edit_no_registrado
  #  identificador = params[:identificador]

    #perro_existe = PerrosEncontrado.find_by(token: identificador)

    #respond_to do |format|
     # if perro_existe

      #  format.html { redirect_to edit_perros_encontrado_path(perro_existe.id) }
       # format.json { render json: { url: edit_perros_encontrado_path(perro_existe) } }
      #else
        #format.html { redirect_to root_path, alert: "No se encontro un perro con este identificador." }
       # format.json { render json: { error: "No se encontro un perro con este identificador." }, status: :unprocessable_entity }
     # end
    #end
  #end


  # POST /perros_encontrados or /perros_encontrados.json
  def create
    @perros_encontrado = PerrosEncontrado.new(perros_encontrado_params)

    @perros_encontrado.usuario_autenticado = user_signed_in?
    @perros_encontrado.action_type = 'create'
    if user_signed_in?
      respond_to do |format|
        if @perros_encontrado.save
          format.html { redirect_to perros_encontrados_path}
          flash[:notice] = "El perro se ha publicado exitosamente."
          format.json { render :show, status: :created, location: @perros_encontrado }
        else
          flash[:alert] = "Falló la publicacion del perro."
          format.html { render :new, status: :unprocessable_entity }

          format.json { render json: @perros_encontrado.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @perros_encontrado.save
          format.html { redirect_to perros_encontrados_path}
          flash[:notice] = "El perro se ha publicado exitosamente."
          format.json { render :show, status: :created, location: @perros_encontrado }
        else
          flash[:alert] = "Falló la publicacion del perro."
          format.html { redirect_to new_perros_encontrado_path, alert: "Mail ya registrado y/o nombre ya en uso con este mail" }

          format.json { render json: @perros_encontrado.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /perros_encontrados/1 or /perros_encontrados/1.json
  def update
    @perros_encontrado.usuario_autenticado = user_signed_in?
    @perros_encontrado.action_type = 'update'

    if user_signed_in?
      respond_to do |format|
        if @perros_encontrado.update(perros_encontrado_params)
          format.html { redirect_to perros_encontrados_path, notice: "La publicacion ha sido editada correctamente!" }
          format.json { render :show, status: :ok, location: @perros_encontrado }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @perros_encontrado.errors, status: :unprocessable_entity }
        end
      end
    else
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
    @perros_encontrado.usuario_autenticado = user_signed_in?
    if @perros_encontrado.update(status: 'Dueño encontrado')
      redirect_to perros_encontrados_path, notice: 'El perro ha sido marcado como dueño encontrado.'
    else
      redirect_to perros_encontrados_path, alert: 'No se pudo marcar el perro como dueño encontrado.'
    end


  end

  def enviar_correo_perros_encontrados

    id = params[:id]
    @perro = PerrosEncontrado.find(id)

    @current_user = current_user

    PerrosEncontradosMailer.enviar_correo_perros_encontrados(@perro, @current_user).deliver_later

    respond_to do |format|
      format.html { redirect_to root_path, flash: { notice: "El correo fue enviado con exito." } }
      format.json { head :no_content }
    end

  end

  def enviar_correo_perros_encontrados_contactar

    id = params[:id]
    @perro = PerrosEncontrado.find(id)

    nombre = params[:nombre]
    apellido = params[:apellido]
    direccion = params[:direccion]
    numero = params[:numero]
    email = params[:email]

    existing_user = User.find_by(email: params[:email])

    if existing_user || (email == @perro.mail)
      # El correo electrónico ya está registrado, realiza alguna acción (por ejemplo, mostrar un mensaje de error)
      flash[:alert] = "El correo electrónico ya está registrado en la veterinaria o estas intentando contactarrte a ti mismo"
      redirect_back(fallback_location: root_path) # Puedes redirigir a donde desees
    else
      PerrosEncontradosMailer.enviar_correo_perros_encontrados_contactar(@perro, nombre, apellido, direccion, numero, email).deliver_later

      respond_to do |format|
        format.html { redirect_to root_path, flash: { notice: "El correo fue enviado con exito." } }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perros_encontrado
      @perros_encontrado = PerrosEncontrado.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def perros_encontrado_params
      params.require(:perros_encontrado).permit(:nombre, :foto, :fecha_de_publicacion, :status, :mail, :descripcion, :nombre_dueno, :apellido_dueno, :direccion_dueno, :numero_dueno, :_method, :raza, :edad_aproximada, :tamano, :lugar_zona_donde_se_encontro)
    end
end
