class CreatePerros < ActiveRecord::Migration[7.1]
  def change
    create_table :perros do |t|
      t.string :nombre
      t.integer :dia
      t.integer :mes
      t.integer :anio
      t.string :caracteristicas
      t.string :condiciones
      t.string :raza
      t.string :color
      t.string :tamanio
      t.string :libreta
      t.string :historia

      t.timestamps
    end
  end
end
