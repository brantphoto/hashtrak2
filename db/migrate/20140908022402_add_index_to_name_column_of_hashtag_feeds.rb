class AddIndexToNameColumnOfHashtagFeeds < ActiveRecord::Migration
  def change
    add_index :hashtag_feeds, :name
  end
end
