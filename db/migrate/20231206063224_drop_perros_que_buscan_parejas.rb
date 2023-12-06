class DropPerrosQueBuscanParejas < ActiveRecord::Migration[7.1]
  def change
    drop_table :perros_que_buscan_parejas
  end
end
