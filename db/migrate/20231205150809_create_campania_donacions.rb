class CreateCampaniaDonacions < ActiveRecord::Migration[7.1]
  def change
    create_table :campania_donacions do |t|
      t.string :nombre
      t.string :motivo
      t.string :beneficiario
      t.float :monto_total
      t.float :monto_actual
      t.integer :dia_limite
      t.integer :mes_limite
      t.integer :anio_limite
      t.string :imagen

      t.timestamps
    end
  end
end
