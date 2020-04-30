class AddTotalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total, :string
  end
end
