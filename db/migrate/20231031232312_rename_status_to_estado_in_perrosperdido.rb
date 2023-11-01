class RenameStatusToEstadoInPerrosPerdidos < ActiveRecord::Migration[7.1]
  def change
    rename_column :perros_perdidos, :status, :estado
  end
end
