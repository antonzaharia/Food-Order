class Order < ActiveRecord::Base
    belongs_to :user
    belongs_to :restaurant
    has_many :order_itemso
    has_many :items, :through => :order_items
end
