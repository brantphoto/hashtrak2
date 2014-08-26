class AddPostCommentToPost < ActiveRecord::Migration
  def change
    add_column :posts, :post_comment, :string
    add_column :posts, :post_caption, :string
  end
end
