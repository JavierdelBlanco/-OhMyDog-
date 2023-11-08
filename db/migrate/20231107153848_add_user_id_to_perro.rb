class AddUserIdToPerro < ActiveRecord::Migration[7.1]
  def change
    add_reference :perros, :user, null: false, foreign_key: true
  end
end
