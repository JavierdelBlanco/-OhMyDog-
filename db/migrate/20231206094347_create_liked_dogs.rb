class CreateLikedDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :liked_dogs do |t|
      t.integer :perro_id
      t.integer :liked_dog_id

      t.timestamps
    end
  end
end
