class HashtagFeedSerializer < ActiveModel::Serializer
  attributes :id, :sorted_hash, :hash_namer 

  def sorted_hash
  @e = object.hashtag_hash.sort_by {|k,v| v}.reverse
  end

  def hash_namer
    @e[0][0]
  end

end
