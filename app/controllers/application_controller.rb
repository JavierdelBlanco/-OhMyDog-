class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    resource.perritos.create(perrito)

  end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :email, :direccion, :nro, :telefono, :tipo_usuario, :perrito => [:nombre_perro, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :color, :tamaño]])
    end

    private

    def user_params
      params.require(:user).permit(:email, :nombre, :apellido, :tipo_usuario, :telefono, :perrito => [:nombre_perro, :dia, :mes, :año, :caracteristicas, :raza, :color, :tamaño])
    end

end
