class CreateVacunaEs < ActiveRecord::Migration[7.1]
  def change
    create_table :vacuna_es do |t|
      t.references :historia_c, null: false, foreign_key: true
      t.integer :dia
      t.integer :mes
      t.integer :anio
      t.string :tipo
      t.string :lote
      t.integer :dosis
      t.text :detalle
      t.text :marca

      t.timestamps
    end
  end
end
