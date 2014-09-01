class AddUserIdToInstaUser < ActiveRecord::Migration
  def change
    add_column :insta_users, :userid, :string
  end
end
