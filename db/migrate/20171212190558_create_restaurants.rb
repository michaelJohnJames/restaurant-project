class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :review
      t.string :order
      t.integer :user_id
      t.timestamps
    end
  end
end
