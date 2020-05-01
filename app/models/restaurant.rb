class Restaurant < ActiveRecord::Base
    has_secure_password

    has_many :items
    has_many :order_items
    has_many :orders
    has_many :users, :through => :orders
    
    validates :name, :presence => true
    validates :genre, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true
end
