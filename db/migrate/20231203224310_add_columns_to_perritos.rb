class AddColumnsToPerritos < ActiveRecord::Migration[7.1]
  def change
    add_column :perritos, :sexo, :string
  end
end
