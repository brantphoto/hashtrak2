class HashtagFeedSerializer < ActiveModel::Serializer
  attributes :id, :name, :sorted_hash, :top_hashfeed,:category, :definition

  def sorted_hash
  @e = object.hashtag_hash.sort_by {|k,v| v.to_i}.reverse[1..10]
  end

  def top_hashfeed
    @top_hashfeed = HashtagFeed.where(:name => @e[0][0]).first_or_create
    object.update(category:object.whobigger(object, @top_hashfeed))
    return @top_hashfeed.name
  end

  def category
    object.category
  end
  def definition
      wordnik_json = Wordnik.word.get_definitions(object.category.name)
      if wordnik_json != []
        wordnik_json.first['text']
      else
        "(It's either shorthand or slang. We're not sure if it counts as a real category.)"
      end
  end

end
