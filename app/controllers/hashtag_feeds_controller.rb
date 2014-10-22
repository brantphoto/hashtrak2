class HashtagFeedsController < ApplicationController
  respond_to :html, :json

  def index
  end


  def show
    #@hashtag_feed = HashtagFeed.where(id: params[:id]).first

     @hashtag_feed = HashtagFeed.where(name: params[:id]).first
     gon.hashfeed_id = @hashtag_feed.id
    @hasher = @hashtag_feed.hashtag_hash.sort_by {|k,v| v}.reverse
    @hasher.delete_if {|key, value| key == @hashtag_feed.name }
    @hash_namer = @hasher[0][0]
    @top_hashfeed = HashtagFeed.where(:name => @hash_namer).first_or_create
    @hashtag_feed.update(category:whobigger(@hashtag_feed, @top_hashfeed))
    if @hashtag_feed.save
      @category = @hashtag_feed.category
      wordnik_json = Wordnik.word.get_definitions(@category.name)
      if wordnik_json != []
        @category_def = wordnik_json.first['text']
      else
        @category_def = "(It's either shorthand or slang. We're not sure if it counts as a real category.)"
      end
    end
    respond_with @hashtag_feed, each_serializer: HashtagFeedSerializer
  end

  def whobigger(hashtag_feed,top_hashfeed)
    if top_hashfeed.hash_sizes.count == 0
      x = find_top_hash_size(top_hashfeed)
    else
      x = top_hashfeed.hash_sizes.last.size
    end
    if x == nil
      x = 0
    end
    if hashtag_feed.hash_sizes.last.size >= x
      return get_category(hashtag_feed)
    else
      return get_category(top_hashfeed)
    end
  end
 
  def find_top_hash_size(top_hashfeed)
    presponse = HTTParty.get("https://api.instagram.com/v1/tags/#{top_hashfeed.name}?client_id=e7e5e08b2c444bf5a395ff0d1e5427be")
    parsedobj1 = JSON.parse(presponse.body)
    sizer = parsedobj1['data']['media_count']
    x = HashSize.create(size:sizer, hashtag_feed:top_hashfeed)
    return x.size
  end

  def get_category(hashfeed) 
    return Category.where(:name => hashfeed.name).first_or_create
  end
end
