# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    super do |resource|
      if resource.persisted?
        # Si el usuario se ha creado con éxito, crea un perrito asociado
        perrito_attributes = params.require(:user).permit(perrito: {}).permit!
        puts perrito_attributes
        resource.perritos.create(perrito_attributes[:perrito])
      end
    end
  end

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :email, :password, :password_confirmation, :tipo_usuario, :perrito_attributes => [:nombre_perro, :fecha_de_nacimiento, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :password, :password_confirmation, perrito_attributes: [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :password, :password_confirmation, :direccion, :nro, :tipo_usuario, :perrito_attributes => [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
  end




  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
   #  devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
