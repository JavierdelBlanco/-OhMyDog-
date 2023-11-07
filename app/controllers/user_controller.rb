# app/controllers/users_controller.rb
class UserController < ApplicationController
  before_action :authenticate_user! # Asegura que el usuario esté autenticado

end
