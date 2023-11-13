class ProfileController < ApplicationController

    before_action :authenticate_user! # Asegura que el usuario esté autenticado

    def edit
      @user = current_user # Obtén el usuario actualmente autenticado
    end
end
