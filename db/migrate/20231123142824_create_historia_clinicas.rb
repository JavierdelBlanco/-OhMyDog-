class CreateHistoriaClinicas < ActiveRecord::Migration[7.1]
  def change
    create_table :historia_clinicas do |t|
      t.references :perrito, null: false, foreign_key: true
      t.string :tipo
      t.integer :dia
      t.integer :mes
      t.integer :año
      t.text :detalle
      t.string :tipoVacuna
      t.string :lote
      t.integer :dosis
      t.string :producto
      t.text :sintomas
      t.text :diagnostico
      t.text :tratamiento

      t.timestamps
    end
  end
end
