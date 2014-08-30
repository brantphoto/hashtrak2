class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :topic
      t.references :hashtag_feed, index: true

      t.timestamps
    end
  end
end
