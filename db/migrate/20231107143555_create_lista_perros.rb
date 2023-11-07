class CreateListaPerros < ActiveRecord::Migration[7.1]
  def change
    create_table :lista_perros do |t|
      t.references :user, null: false, foreign_key: true
      t.references :perro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
