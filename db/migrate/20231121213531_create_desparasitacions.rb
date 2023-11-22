class CreateDesparasitacions < ActiveRecord::Migration[7.1]
  def change
    create_table :desparasitacions do |t|
      t.references :historia_c, null: false, foreign_key: true
      t.integer :dia
      t.integer :mes
      t.integer :anio
      t.string :producto
      t.string :lote
      t.integer :dosis
      t.text :detalle

      t.timestamps
    end
  end
end
