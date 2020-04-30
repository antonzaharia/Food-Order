class AddGenreToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :genre, :string
  end
end
