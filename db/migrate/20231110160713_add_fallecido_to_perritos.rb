class AddFallecidoToPerritos < ActiveRecord::Migration[7.1]
  def change
    add_column :perritos, :fallecido, :boolean
  end
end
