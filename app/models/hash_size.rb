class HashSize < ActiveRecord::Base
  belongs_to :hashtag_feed

  # validates :size, presence: true
  # validates_numericality_of :size

  # validates :hashtag_feed_id, presence: true


  
  #probably implied already, will have to delete this most likely
  #validates :created_at, presence: true
  #validates :updated_at, presence: true

end
