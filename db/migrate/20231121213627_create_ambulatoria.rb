class CreateAmbulatoria < ActiveRecord::Migration[7.1]
  def change
    create_table :ambulatoria do |t|
      t.references :historia_c, null: false, foreign_key: true
      t.integer :dia
      t.integer :mes
      t.integer :anio
      t.text :sintomas
      t.text :diagnostico
      t.text :tratamiento
      t.text :detalles

      t.timestamps
    end
  end
end
