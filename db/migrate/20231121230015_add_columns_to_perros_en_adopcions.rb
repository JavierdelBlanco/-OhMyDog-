class AddColumnsToPerrosEnAdopcions < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_en_adopcions, :descripcion, :string
    add_column :perros_en_adopcions, :mail, :string
  end
end
