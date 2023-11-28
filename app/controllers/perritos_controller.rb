class PerritosController < ApplicationController
  before_action :set_perrito, only: [:show, :edit, :update, :destroy]

  # GET /perritos or /perritos.json
  def index
    @perritos = Perrito.all
  end

  # GET /perritos/1 or /perritos/1.json
  def show
  end

  # GET /perritos/new
  def new
    @perrito = Perrito.new
    @user = User.find(params[:id])
    @tipo = 'mio'

  end

  def new_ajeno
    @perrito = Perrito.new
    @user = User.find(params[:id])
    @tipo = 'ajeno'
    puts 'se creo el perro ajeno'
  end

  # GET /perritos/1/edit
  def edit
    @user = @perrito.user
  end

  # POST /perritos or /perritos.json
  def create
    user_id = params[:perrito][:user_id]
    tipo = params[:perrito][:tipo]
    @tipo = tipo
    @user = User.find(user_id)
    parametros = perrito_params.except(:tipo)
    @perrito = @user.perritos.build(parametros)

    # Crear la historia clínica asociada sin asignar asociaciones específicas
    @historia_clinica = HistoriaClinica.new
    # Asignar la historia clínica al perrito
    @perrito.historia_clinica = @historia_clinica

    respond_to do |format|
      if @perrito.save
        if(@tipo=='mio')
          format.html { redirect_to ver_perfil_path(current_user.id), notice: "Se creó un perro exitosamente." }
          format.json { render :show, status: :created, location: @perrito }
        else
          format.html { redirect_to user_path(@user), notice: "Se creó un perro exitosamente." }
          format.json { render :show, status: :created, location: @perrito }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perritos/1 or /perritos/1.json
  def update
    user_id = params[:perrito][:user_id]
    @user = User.find(user_id)
    tipo = params[:perrito][:tipo]
    respond_to do |format|
      parametros = perrito_params.except(:tipo)
      if @perrito.update(parametros)
        puts '##############################################'
        puts tipo
        if(tipo=='mio')
          format.html { redirect_to ver_perfil_path(current_user), notice: "Se creó un perro exitosamente." }
          format.json { render :show, status: :ok, location: @perrito }
        else
          format.html { redirect_to user_path(@user), notice: "Se actualizó el perro exitosamente." }
          format.json { render :show, status: :ok, location: @perrito }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perrito.errors, status: :unprocessable_entity }
      end
    end
  end

  def marcar_fallecido
    @user = User.find(params[:user])
    tipo = params[:tipo]
    puts '#########################################'
    puts tipo
    puts '#########################################'
    @perrito = @user.perritos.find_by(id: params[:id])
    if (@perrito.update(fallecido: true))
      if(tipo=='mio')
        redirect_to ver_perfil_path(current_user), notice: "Se actualizó el perro exitosamente."
      else
        redirect_to user_path(@user), notice: "Se actualizó el perro exitosamente."
      end
    end
  end

  # DELETE /perritos/1 or /perritos/1.json
  def destroy
   # user_id = params[:user_id]
    #@user = User.find(user_id)
    #tipo = params[:tipo]
    #puts '########################################'
    #puts user_id
    #puts tipo
    #puts '########################################'
    @perrito = Perrito.find(params[:id])
    @user = @perrito.user
    @perrito.destroy
    respond_to do |format|
      if(current_user.id == @user.id)
        format.html { redirect_to ver_perfil_path(@user.id), notice: "Se eliminó exitosamente el perro." }
        format.json { head :no_content }
      else
        format.html { redirect_to user_path(@user), notice: "Se eliminó exitosamente el perro." }
        format.json { head :no_content }
      end
    end
  end

  def ver
    @perrito = Perrito.find(params[:id])
    @user = User.find(params[:user])
    @historia_clinicas = HistoriaClinica.all
  end

  def agregar_historia
    @perrito = Perrito.find(params[:id])
    if @perrito.tiene_historia_clinica_de_tipo?('castracion')
      puts '##########################'
      puts @perrito.tiene_historia_clinica_de_tipo?('castracion')
      @castrado=true
    else
      @castrado=false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perrito
      @perrito = Perrito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perrito_params
      params.require(:perrito).permit(:nombre, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño, :user_id, :fallecido, :tipo)
    end
end
