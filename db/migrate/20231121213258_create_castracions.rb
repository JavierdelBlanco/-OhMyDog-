class CreateCastracions < ActiveRecord::Migration[7.1]
  def change
    create_table :castracions do |t|
      t.references :historia_c, null: false, foreign_key: true
      t.integer :dia
      t.integer :mes
      t.integer :anio
      t.text :detalle

      t.timestamps
    end
  end
end
