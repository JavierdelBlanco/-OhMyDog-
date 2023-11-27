class CreateVeterinariasDeGuardia < ActiveRecord::Migration[7.1]
  def change
    create_table :veterinarias_de_guardia do |t|
      t.date :dia
      t.integer :telefono
      t.string :mail
      t.binary :foto
      t.string :direccion

      t.timestamps
    end
  end
end
