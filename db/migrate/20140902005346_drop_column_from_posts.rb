class DropColumnFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :location_id
  end
end
