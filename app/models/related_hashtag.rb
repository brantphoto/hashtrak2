class RelatedHashtag < ActiveRecord::Base
	has_many :related_hashtag_posts
	has_many :posts, through: :related_hashtag_posts

	validates_uniqueness_of :name
	validates :name, presence: true
end
