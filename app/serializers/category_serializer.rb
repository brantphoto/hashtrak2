class CategorySerializer < ActiveModel::Serializer
  attributes :name, :hashtag_feeds

  def hashtag_feeds
    HashtagFeed.where(category_id: object.id).pluck(:name)
  end

end
