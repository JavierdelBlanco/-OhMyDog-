class CreateDislikedDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :disliked_dogs do |t|
      t.integer :perro_id
      t.integer :disliked_dog_id

      t.timestamps
    end
  end
end
