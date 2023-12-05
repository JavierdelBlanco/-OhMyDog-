# db/migrate/20231205050039_create_perros_que_buscan_parejas.rb
class CreatePerrosQueBuscanParejas < ActiveRecord::Migration[7.1]
  def change
    create_table :perros_que_buscan_parejas do |t|
      t.string :nombre
      t.integer :dia
      t.integer :mes
      t.integer :año
      t.text :caracteristicas
      t.text :condiciones
      t.string :raza
      t.string :sexo
      t.string :color
      t.string :tamaño
      t.boolean :fallecido
      t.integer :user_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.boolean :postulado

      t.index [:user_id], name: "index_perros_que_buscan_parejas_on_user_id"
    end

    # Copia los datos específicos de 'perritos' a 'perros_que_buscan_parejas'
    execute("INSERT INTO perros_que_buscan_parejas (nombre, dia, mes, año, caracteristicas, condiciones, raza, sexo, color, tamaño, fallecido, user_id, created_at, updated_at, postulado) SELECT nombre, dia, mes, año, caracteristicas, condiciones, raza, sexo, color, tamaño, fallecido, user_id, created_at, updated_at, NULL AS postulado FROM perritos")
  end
end
