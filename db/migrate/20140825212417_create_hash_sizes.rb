class CreateHashSizes < ActiveRecord::Migration
  def change
    create_table :hash_sizes do |t|
      t.integer :size
      t.references :hashtag_feed, index: true

      t.timestamps
    end
  end
end
