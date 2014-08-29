class HashtagFeed < ActiveRecord::Base
  belongs_to :category
  has_many :hash_sizes
  has_many :posts


  #needs to be refactored so it can be DRY
  #validates the attributes within hashtag feed model
  validates :name, presence: true
  validates_uniqueness_of :name
 
end