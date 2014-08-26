class HashtagFeed < ActiveRecord::Base
  belongs_to :category
  has_many :hash_sizes
end
