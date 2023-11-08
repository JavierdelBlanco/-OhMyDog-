class CreatePerrosEncontrados < ActiveRecord::Migration[7.1]
  def change
    create_table :perros_encontrados do |t|
      t.string :nombre
      t.binary :foto
      t.date :fecha_de_publicacion
      t.string :status
      t.string :mail
      t.string :descripcion

      t.timestamps
    end
  end
end
