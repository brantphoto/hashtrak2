class ChangeColumnsOnPost < ActiveRecord::Migration
  def change
    remove_column :posts, :post_comment, :string
    remove_column :posts, :post_caption, :string
  end
end
