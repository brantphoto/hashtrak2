class HashtagFeedSerializer < ActiveModel::Serializer
  attributes :id, :sorted_hash, :hash_namer 

  def sorted_hash
  @e = object.hashtag_hash.sort_by {|k,v| v.to_i}.reverse[1..10]
  end

  def hash_namer
    @e[0][0]
  end
  

end
