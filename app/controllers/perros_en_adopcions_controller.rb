class PerrosEnAdopcionsController < ApplicationController
  before_action :set_perros_en_adopcion, only: %i[ show edit update destroy ]

  # GET /perros_en_adopcions or /perros_en_adopcions.json
  def index

    @all_dogs = PerrosEnAdopcion.all

    if params[:filter].present?
      perros_en_adopcion = PerrosEnAdopcion.where(mail: params[:filter], status: true).order(created_at: :desc)
      perros_adoptados = PerrosEnAdopcion.where(mail: params[:filter], status: false).limit(50).order(created_at: :asc)

      # Combinar perros perdidos y encontrados
      @perros = perros_en_adopcion + perros_adoptados

      # Ordenar la lista combinada por status y fecha de forma descendente
      @perros = @perros.sort_by { |perro| [perro.status ? 1 : 0, perro.created_at] }.reverse


      # Aplicar paginación a la lista
      @perros = Kaminari.paginate_array(@perros).page(params[:page]).per(3)
    else
      perros_en_adopcion = PerrosEnAdopcion.where(status: true).order(created_at: :desc)
      perros_adoptados = PerrosEnAdopcion.where(status: false).limit(50).order(created_at: :asc)

      # Combinar perros perdidos y encontrados
      @perros = perros_en_adopcion + perros_adoptados

      # Ordenar la lista combinada por status y fecha de forma descendente
      @perros = @perros.sort_by { |perro| [perro.status ? 1 : 0, perro.created_at] }.reverse


      # Aplicar paginación a la lista
      @perros = Kaminari.paginate_array(@perros).page(params[:page]).per(3)
    end

    @users = User.all

  end

  # GET /perros_en_adopcions/1 or /perros_en_adopcions/1.json
  def show
  end

  # GET /perros_en_adopcions/new
  def new
    @perros_en_adopcion = PerrosEnAdopcion.new
  end

  # GET /perros_en_adopcions/1/edit
  def edit
  end

  # POST /perros_en_adopcions or /perros_en_adopcions.json
  def create
    @perros_en_adopcion = PerrosEnAdopcion.new(perros_en_adopcion_params)
    @perros_en_adopcion.action_type = 'create'

    respond_to do |format|
      if @perros_en_adopcion.save
        format.html { redirect_to perros_en_adopcions_path, notice: "El perro se ha publicado exitosamente!" }
        format.json { render :show, status: :created, location: @perros_en_adopcion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perros_en_adopcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perros_en_adopcions/1 or /perros_en_adopcions/1.json
  def update
    @perros_en_adopcion.action_type = 'update'
    respond_to do |format|
      if @perros_en_adopcion.update(perros_en_adopcion_params)
        format.html { redirect_to perros_en_adopcions_path, notice: "La publicación ha sido editada correctamente!" }
        format.json { render :show, status: :ok, location: @perros_en_adopcion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perros_en_adopcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perros_en_adopcions/1 or /perros_en_adopcions/1.json
  def destroy
    @perros_en_adopcion.destroy!

    respond_to do |format|
      format.html { redirect_to perros_en_adopcions_url, notice: "Perros en adopcion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def marcar_como_adoptado

    @perros_en_adopcion = PerrosEnAdopcion.find(params[:id])
    if @perros_en_adopcion.update(status: false)
      redirect_to perros_en_adopcions_path, notice: 'El perro ha sido marcado como adoptado.'
    else
      redirect_to perros_en_adopcions_path, alert: 'No se pudo marcar el perro como adoptado.'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perros_en_adopcion
      @perros_en_adopcion = PerrosEnAdopcion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perros_en_adopcion_params
      params.require(:perros_en_adopcion).permit(:nombre, :foto, :fecha_de_publicacion, :status, :raza, :sexo, :edad, :tamano, :mail, :descripcion)
    end
end
