class CreateInstaUsers < ActiveRecord::Migration
  def change
    create_table :insta_users do |t|
      t.string :username

      t.timestamps
    end
  end
end
