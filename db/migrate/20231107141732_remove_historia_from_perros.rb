class RemoveHistoriaFromPerros < ActiveRecord::Migration[7.1]
  def change
    remove_column :perros, :historia, :string
  end
end
