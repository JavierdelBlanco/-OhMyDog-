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
  end

  # POST /perritos or /perritos.json
  def create
    user_id = params[:perrito][:user_id]
    tipo = params[:perrito][:tipo]
    @tipo = tipo
    @user = User.find(user_id)
    parametros = perrito_params.except(:tipo)
    @perrito = @user.perritos.build(parametros)
    
    respond_to do |format|
      if @perrito.save
        if(@tipo=='mio')
          format.html { redirect_to perfil_path, notice: "Se creó un perro exitosamente." }
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
        if(@tipo=='mio')
          format.html { redirect_to perfil_path, notice: "Se actualizó el perro exitosamente." }
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
        format.html { redirect_to perfil_path, notice: "Se eliminó exitosamente el perro." }
        format.json { head :no_content }
      else
        format.html { redirect_to user_path(@user), notice: "Se eliminó exitosamente el perro." }
        format.json { head :no_content }
      end
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
