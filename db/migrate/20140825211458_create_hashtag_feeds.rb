class CreateHashtagFeeds < ActiveRecord::Migration
  def change
    create_table :hashtag_feeds do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps
    end
  end
end
