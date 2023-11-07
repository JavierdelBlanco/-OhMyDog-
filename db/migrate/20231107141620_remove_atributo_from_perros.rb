class RemoveAtributoFromPerros < ActiveRecord::Migration[7.1]
  def change
    remove_column :perros, :libreta, :string
  end
end
