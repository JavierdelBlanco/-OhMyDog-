class AddNumeroDuenoToPerrosEncontrados < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_encontrados, :numero_dueno, :integer
  end
end
