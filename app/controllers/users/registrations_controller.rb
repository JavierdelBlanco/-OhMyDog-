# frozen_string_literal: true
require 'securerandom'

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?

 # def create
 #   super do |resource|
 #     if resource.persisted?
 #       # Si el usuario se ha creado con éxito, crea un perrito asociado
 #       perrito_attributes = params.require(:user).permit(perrito: {}).permit!
 #       puts perrito_attributes
 #       resource.perritos.create(perrito_attributes[:perrito])
 #       UserMailer.with(user: resource).welcome_email.deliver_now
 #     end
 #   end
 # end

  def create
      build_resource(sign_up_params)
      resource.save
      if resource.persisted?
        random_password = SecureRandom.hex(8)
        resource.password = random_password
        resource.password_confirmation = random_password
        resource.save
        UserMailer.random_password_email(resource.email, resource.password).deliver_later
        perrito_attributes = params.require(:user).permit(perrito: {}).permit!
        resource.perritos.create(perrito_attributes[:perrito])
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          #sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
  end

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :email, :password, :password_confirmation, :direccion, :nro, :tipo_usuario, :telefono, :perrito_attributes => [:nombre_perro, :fecha_de_nacimiento, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :password, :password_confirmation, :direccion, :nro, :telefono, perrito_attributes: [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :password, :password_confirmation, :direccion, :nro, :tipo_usuario, :telefono, :perrito_attributes => [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
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
