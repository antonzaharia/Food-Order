class Restaurant < ActiveRecord::Base
    has_many :items
    has_many :order_items
    has_many :orders
    has_many :users, :through => :orders
end
