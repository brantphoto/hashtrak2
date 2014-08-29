class ChangedNameOfHashtagInPost < ActiveRecord::Migration
  def change
  	rename_column :posts, :hashtag, :hashtags
  end
end
