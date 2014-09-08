class AddIndexsToRelatedHashtags < ActiveRecord::Migration
  def change
    add_index :related_hashtags, :is_spam
  end
end
