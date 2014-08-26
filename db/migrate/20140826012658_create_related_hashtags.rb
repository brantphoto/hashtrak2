class CreateRelatedHashtags < ActiveRecord::Migration
  def change
    create_table :related_hashtags do |t|
      t.string :name

      t.timestamps
    end
  end
end
