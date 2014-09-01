class Search < ActiveRecord::Base
  belongs_to :hashtag_feed

  validates :topic, presence: true
end
