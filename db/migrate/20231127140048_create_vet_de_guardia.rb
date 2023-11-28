class CreateVetDeGuardia < ActiveRecord::Migration[7.1]
  def change
    create_table :vet_de_guardia do |t|
      t.binary :foto
      t.date :dia
      t.integer :telefono
      t.string :mail
      t.string :direccion

      t.timestamps
    end
  end
end
