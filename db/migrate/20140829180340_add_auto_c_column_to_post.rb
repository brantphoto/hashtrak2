class AddAutoCColumnToPost < ActiveRecord::Migration
  def change
  	add_column :hashtag_feeds, :auto_categorized, :boolean, :default => false
  end
end
