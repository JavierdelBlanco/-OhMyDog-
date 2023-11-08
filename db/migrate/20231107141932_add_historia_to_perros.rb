class AddHistoriaToPerros < ActiveRecord::Migration[7.1]
  def change
    add_column :perros, :historia, :text
  end
end
