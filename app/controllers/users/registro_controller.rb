class Users::RegistroController < ApplicationController
    before_action :authenticate_user!

    def new
      @user = User.new
    end

    def create
      user_params_without_perrito = user_params.except(:perrito)
      @user = User.create(user_params_without_perrito)
      random_password = SecureRandom.base64(8)
      while(!(random_password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/)))
        random_password = SecureRandom.base64(8)
      end
      @user.password = random_password
      @user.password_confirmation = random_password
      if @user.save
        UserMailer.random_password_email(@user.email, random_password).deliver_later
        @user.perritos.create(user_params[:perrito])
        redirect_to atencion_cliente_path
        flash[:notice] = 'Creación de usuario exitosa'
      else
        flash[:alert] = "Fallo la creacion de usuario"
        redirect_to creacion_usuario_path
      end
    end

    private

    def user_params
      params.require(:user).permit(:nombre, :apellido, :email, :direccion, :nro, :telefono, :tipo_usuario, :perrito => [:nombre, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño, :fallecido]) # Tus atributos de User
    end
  end
