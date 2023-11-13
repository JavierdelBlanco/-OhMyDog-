class CreatePerritos < ActiveRecord::Migration[7.1]
  def change
    create_table :perritos do |t|
      t.string :nombre
      t.integer :dia
      t.integer :mes
      t.integer :año
      t.text :caracteristicas
      t.text :condiciones
      t.string :raza
      t.string :color
      t.string :tamaño
      t.boolean :fallecido
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
