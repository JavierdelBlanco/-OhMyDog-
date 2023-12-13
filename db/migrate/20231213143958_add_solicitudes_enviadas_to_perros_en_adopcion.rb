class AddSolicitudesEnviadasToPerrosEnAdopcion < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_en_adopcions, :solicitudes_enviadas, :json
  end
end
