class ChangeHistoriaCColumnsNullable < ActiveRecord::Migration[7.1]
  def change
    change_column :historia_cs, :castracion_id, :bigint, null: true
    change_column :historia_cs, :vacuna_e_id, :bigint, null: true
    change_column :historia_cs, :vacuna_r_id, :bigint, null: true
    change_column :historia_cs, :desparasitacion_id, :bigint, null: true
    change_column :historia_cs, :ambulatorium_id, :bigint, null: true
  end
end
