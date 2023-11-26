class CreatePerrosEnAdopcions < ActiveRecord::Migration[7.1]
  def change
    create_table :perros_en_adopcions do |t|
      t.string :nombre
      t.binary :foto
      t.date :fecha_de_publicacion
      t.boolean :status
      t.string :raza
      t.string :sexo
      t.integer :edad
      t.string :tamano

      t.timestamps
    end
  end
end
