# app/controllers/users_controller.rb
class UserController < ApplicationController
  before_action :authenticate_user! # Asegura que el usuario esté autenticado

  def agregar_perrito
    @perrito = Perrito.new
  end

  def create
    @perrito = current_user.Perrito.new(perrito_params) # Se esperan los parámetros del formulario
    if @perrito.save
      redirect_to 'user#ver_perfil', notice: 'Perrito agregado exitosamente.'
    else
      render 'new'
    end
  end
  

  def show_perrito
    @usuario = Usuario.find(params[:id])
    @perrito = @usuario.perritos.find(1)
  end

end
