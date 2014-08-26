class AddInstagramIdToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :instagram_id, :string
  end
end
