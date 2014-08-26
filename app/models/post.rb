class Post < ActiveRecord::Base
  belongs_to :location
  belongs_to :insta_user
  belongs_to :hashtag_feed
  has_many :related_hashtag_posts
  has_many :related_hashtags, through: :related_hashtag_posts
end
