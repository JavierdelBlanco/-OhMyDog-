class AddAtributoToPerros < ActiveRecord::Migration[7.1]
  def change
    add_column :perros, :libreta, :text
  end
end
