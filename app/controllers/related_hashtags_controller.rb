class RelatedHashtagsController < ApplicationController
  before_action :get_hashtag_feed
  respond_to :html, :json
  
  def index
    @hasher = Hash.new
    Post.where(hashtag_feed_id:@hashtag_feed.id).scoping do
      y = RelatedHashtag.where(is_spam:false).joins(:posts)
      y.find_each do |z|
        @hasher[z.name] = z.posts.count
      end
    end   
    @hasher = @hasher.sort_by {|k,v| v}.reverse
    #@hasher.delete_if {|key, value| key == @hashtag_feed.name }
    @hash_namer = @hasher[0][0]
    if HashtagFeed.exists?(:name => @hash_namer)
      @top_hashfeed = HashtagFeed.where(:name => @hash_namer).first
    else 
      @top_hashfeed = HashtagFeed.create(name:@hash_namer)
    end
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
    respond_with @hasher
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
    if Category.exists?(:name => hashfeed.name)
      return Category.where(:name => hashfeed.name).first
    else
      return Category.create(name:hashfeed.name)
    end
  end


  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def get_hashtag_feed
    @hashtag_feed = HashtagFeed.find(params[:hashtag_feed_id])
  end
end
