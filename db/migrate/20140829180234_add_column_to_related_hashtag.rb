class AddColumnToRelatedHashtag < ActiveRecord::Migration
  def change
  	add_column :related_hashtags, :is_spam, :boolean, :default => false 
  end
end
