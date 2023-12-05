class AddColumnsToPerrosQueBuscanParejas < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_que_buscan_parejas, :foto, :binary
    add_column :perros_que_buscan_parejas, :descripcion, :string
    add_column :perros_que_buscan_parejas, :fecha_celo_inicio, :date
  end
end
