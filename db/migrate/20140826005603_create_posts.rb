class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :location, index: true
      t.references :insta_user, index: true
      t.references :hashtag_feed, index: true

      t.timestamps
    end
  end
end
