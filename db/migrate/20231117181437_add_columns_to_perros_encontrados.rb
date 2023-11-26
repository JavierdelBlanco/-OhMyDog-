class AddColumnsToPerrosEncontrados < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_encontrados, :raza, :string
    add_column :perros_encontrados, :edad_aproximada, :integer
    add_column :perros_encontrados, :tamaño, :string
    add_column :perros_encontrados, :lugar_zona_donde_se_encontro, :string
  end
end
