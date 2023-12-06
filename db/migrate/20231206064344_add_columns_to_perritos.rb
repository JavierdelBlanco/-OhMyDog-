class AddColumnsToPerritos < ActiveRecord::Migration[7.1]
  def change
    add_column :perritos, :postulado, :boolean
    add_column :perritos, :foto, :binary
    add_column :perritos, :descripcion, :string
    add_column :perritos, :fecha_celo_inicio, :date
  end
end
