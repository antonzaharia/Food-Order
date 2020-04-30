class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :items
      t.timestamps null: true
    end
  end
end
