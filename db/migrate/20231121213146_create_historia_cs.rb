class CreateHistoriaCs < ActiveRecord::Migration[7.1]
  def change
    create_table :historia_cs do |t|
      t.references :perrito, null: false, foreign_key: true
      t.references :castracion, null: true, foreign_key: true
      t.references :vacuna_e, null: true, foreign_key: true
      t.references :vacuna_r, null: true, foreign_key: true
      t.references :desparasitacion, null: true, foreign_key: true
      t.references :ambulatorium, null: true, foreign_key: true

      t.timestamps
    end
  end
end
