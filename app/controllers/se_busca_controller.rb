class SeBuscaController < ApplicationController
  def index
    @lost_dogs = PerrosPerdido.where(status: "Se busca")
    @found_dogs = PerrosPerdido.where(status: "Encontrado")
  end

  def contactar
  end

  def publicar_perdido
  end
end
