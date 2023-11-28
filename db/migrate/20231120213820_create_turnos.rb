class CreateTurnos < ActiveRecord::Migration[7.1]
  def change
    create_table :turnos do |t|
      t.string :nombre_cliente
      t.string :apellido_cliente
      t.string :email_cliente
      t.string :nombres_perros
      t.string :tipo_turno
      t.date :fecha
      t.string :franja_horaria
      t.time :horario
      t.text :detalle
      t.string :estado
      t.timestamps
    end
  end
end
