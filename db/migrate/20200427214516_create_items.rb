class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.string :price
      t.integer :restaurant_id
    end
  end
end 


