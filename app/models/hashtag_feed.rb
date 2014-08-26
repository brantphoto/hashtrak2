class HashtagFeed < ActiveRecord::Base
  belongs_to :category
  has_many :hash_sizes
  has_many :posts
end
