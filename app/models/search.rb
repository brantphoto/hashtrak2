class Search < ActiveRecord::Base
  belongs_to :hashtag_feed
  # validates :topic, presence: true
  
  def preptopic
    x = self.topic.scan(/\A\W*#*(\w*)\W*\z/)
    self.topic = x[0][0]
  end
end
