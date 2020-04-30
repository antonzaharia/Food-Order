class AddGenreToItems < ActiveRecord::Migration
  def change
    add_column :items, :genre, :string
  end
end
