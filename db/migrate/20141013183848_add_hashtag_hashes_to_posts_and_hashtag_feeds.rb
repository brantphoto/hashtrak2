class AddHashtagHashesToPostsAndHashtagFeeds < ActiveRecord::Migration
  def change
    add_column :hashtag_feeds, :hashtag_hash, :hstore
    add_column :posts, :hashtag_hash, :hstore
  end
end
