class AddMailToPerrosPerdido < ActiveRecord::Migration[7.1]
  def change
    add_column :perros_perdidos, :mail, :string
  end
end
