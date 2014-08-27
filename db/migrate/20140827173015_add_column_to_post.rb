class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :location, :json
  end
end
