class PerritosController < ApplicationController
  before_action :set_perrito, only: %i[ show edit update destroy ]

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
  end

  # GET /perritos/1/edit
  def edit
  end

  # POST /perritos or /perritos.json
  def create
    @user = User.find(params[:id])
    @perrito = @user.perritos.build(perrito_params)

    respond_to do |format|
      if @perrito.save
        format.html { redirect_to user_path(@user), notice: "Se creó un perro exitosamente." }
        format.json { render :show, status: :created, location: @perrito }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perrito.errors, status: :unprocessable_entity }
      end
    end
  end

  def agregar_perrito_user
    @user = User.find(params[:id])
    @perrito = @user.perritos.build(perrito_params)

    respond_to do |format|
      if @perrito.save
        format.html { redirect_to user_path(@user), notice: "Se creó un perro exitosamente." }
        format.json { render :show, status: :created, location: @perrito }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perritos/1 or /perritos/1.json
  def update
    respond_to do |format|
      if @perrito.update(perrito_params)
        format.html { redirect_to perfil_path, notice: "Se actualizó el perro exitosamente." }
        format.json { render :show, status: :ok, location: @perrito }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perritos/1 or /perritos/1.json
  def destroy
    @perrito.destroy!

    respond_to do |format|
      format.html { redirect_to perritos_url, notice: "Se eliminó exitosamente el perro." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perrito
      @perrito = Perrito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perrito_params
      params.require(:perrito).permit(:nombre, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño, :user_id, :fallecido)
    end
end
