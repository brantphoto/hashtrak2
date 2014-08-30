class Post < ActiveRecord::Base
  belongs_to :location
  belongs_to :insta_user
  belongs_to :hashtag_feed
  has_many :related_hashtag_posts
  has_many :related_hashtags, through: :related_hashtag_posts

  # validates :instagram_id, presence: true
  # validates_uniqueness_of :instagram_id

  # validates :hashtags, presence: true

  # validates :insta_user_id, presence: true
  

end
