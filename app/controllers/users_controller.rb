# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show] # Asegura que el usuario esté autenticado

  def agregar_perrito
    @perrito = Perrito.new
  end

  def crear_perrito
    @perrito = @user.perritos.build(perrito_params)

    if @perrito.save
      redirect_to user_path(@user), notice: "Perrito agregado con éxito"
    else
      render 'agregar_perrito'
    end
  end

  def atencion
    # ...
    @users = User.all
  end

  def edit
    @user = User.find(params[:id]) # Obtén el usuario que deseas editar
  end

  def edit_otro
    @user = User.find(params[:id])
    # Resto de la lógica de edición aquí
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:alert] = "Falló la edicion del usuario."
      render 'edit_otro', status: :unprocessable_entity
    end
  end

  def agregar_perro_usuario
    @perrito = Perrito.new
  end


  def agregar_perro_usuario_listo
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

  def welcome_email
    UserMailer.welcome_email.deliver_now
  end

  def ver_perfil
    @user = User.find(params[:id])
    @perritos_vivos = @user.perritos.where(fallecido: false)
  end

  def show
    @user = User.find(params[:id])
    @perritos_vivos = @user.perritos.where(fallecido: false)
  end

  def create
    @perrito = current_user.Perrito.new(perrito_params) # Se esperan los parámetros del formulario
    if @perrito.save
      redirect_to 'user#ver_perfil', notice: 'Perrito agregado exitosamente.'
    else
      render 'new'
    end
  end

  def index
    if current_user.tipo_usuario == 'veterinario'
      @users = User.all
      @perritos_vivos = @user.perritos.where(fallecido: false)
    else
      redirect_to root_path, alert: 'No tienes permisos para ver esta página.'
    end
  end

  def atencion
    @users = User.all
  end

  def show_perrito
    @usuario = Usuario.find(params[:id])
    @perrito = @usuario.perritos.find(1)
  end

  private

  def perrito_params
    params.require(@perrito).permit(:nombre, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño, :fallecido)
  end

  def set_perrito
    @perrito = Perrito.find(params[:id])
  end

end
