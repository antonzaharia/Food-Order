class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :genre
      t.string :email
      t.string :password_digest
    end
  end
end
