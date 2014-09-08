class AddIndexOnNameColumnofRelatedHashtags < ActiveRecord::Migration
  def change
    add_index :related_hashtags, :name 
  end
end
