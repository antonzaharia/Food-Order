class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |s|
      s.integer :order_id
      s.integer :item_id
    end
  end
end
