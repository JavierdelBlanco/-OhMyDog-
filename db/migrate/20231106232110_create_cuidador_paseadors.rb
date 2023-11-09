class CreateCuidadorPaseadors < ActiveRecord::Migration[7.1]
  def change
    create_table :cuidador_paseadors do |t|
      t.binary :foto
      t.string :apellido
      t.string :nombre
      t.string :email
      t.integer :telefono
      t.text :zona
      t.text :dias_horarios
      t.string :rol

      t.timestamps
    end
  end
end
