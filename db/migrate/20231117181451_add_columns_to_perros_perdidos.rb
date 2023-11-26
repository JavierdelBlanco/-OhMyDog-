class AddColumnsToPerrosPerdidos < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_perdidos, :raza, :string
    add_column :perros_perdidos, :edad_aproximada, :integer
    add_column :perros_perdidos, :tamaño, :string
    add_column :perros_perdidos, :lugar_zona_donde_se_encontro, :string
  end
end
