class ChangePostDateOnPost < ActiveRecord::Migration
  def change
    remove_column :posts, :post_date, :datetime
    add_column :posts, :created_time, :integer 
  end
end
