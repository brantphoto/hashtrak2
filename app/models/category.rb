class Category < ActiveRecord::Base
	has_many :hashtag_feeds

	validates :name, presence: true
  validates_uniqueness_of :name

	
  #probably implied already, will have to delete this most likely
  #validates :created_at, presence: true
  #validates :updated_at, presence: true

end
