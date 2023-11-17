class CambiarNombresColumnas < ActiveRecord::Migration[7.1]
  def change
    rename_column :perros_encontrados, :tamaño, :tamano
    rename_column :perros_perdidos, :tamaño, :tamano
  end
end
