# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :password, :password_confirmation, :perrito_attributes => [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
   end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :password, :password_confirmation, perrito_attributes: [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
  end

end
