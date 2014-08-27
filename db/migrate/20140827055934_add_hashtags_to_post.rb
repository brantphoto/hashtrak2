class AddHashtagsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :hashtag, :json 
  end
end
