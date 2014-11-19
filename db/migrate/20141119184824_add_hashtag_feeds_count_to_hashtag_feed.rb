class AddHashtagFeedsCountToHashtagFeed < ActiveRecord::Migration
  def change
    add_column :categories, :hashtag_feeds_count, :integer, :default => 0
    Category.reset_column_information
    Category.all.each do |category|
      Category.update_counters(category.id, :hashtag_feeds_count => category.hashtag_feeds.length)
    end
  end
end
