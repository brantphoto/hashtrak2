class RelatedHashtagPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :related_hashtag
end
