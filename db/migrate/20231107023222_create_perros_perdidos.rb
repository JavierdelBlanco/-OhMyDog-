class CreatePerrosPerdidos < ActiveRecord::Migration[7.1]
  def change
    create_table :perros_perdidos do |t|
        t.string "nombre"
        t.binary "foto"
        t.date "fecha_de_publicacion"
        t.string "status"
        t.string "mail"
        t.text "descripcion"
        t.timestamps
    end
  end
end
