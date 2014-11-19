class Category < ActiveRecord::Base
	has_many :hashtag_feeds
	validates :name, presence: true

end
