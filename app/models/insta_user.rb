class InstaUser < ActiveRecord::Base
	has_many :posts
	validates_uniqueness_of :userid

  #probably implied already, will have to delete this most likely
  #validates :created_at, presence: true
  #validates :updated_at, presence: true


end
