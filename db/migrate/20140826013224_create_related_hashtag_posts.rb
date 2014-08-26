class CreateRelatedHashtagPosts < ActiveRecord::Migration
  def change
    create_table :related_hashtag_posts do |t|
      t.references :post, index: true
      t.references :related_hashtag, index: true

      t.timestamps
    end
  end
end
