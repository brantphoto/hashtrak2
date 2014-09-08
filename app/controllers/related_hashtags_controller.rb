class RelatedHashtagsController < ApplicationController
  before_action :get_hashtag_feed
  respond_to :html, :json
  
  def index
    @hasher = Hash.new
    @hashtag_feed.posts.each do |y|
       y.related_hashtags.each do |z|
         if z.is_spam == false
           @hasher[z.name] = z.posts.where(hashtag_feed:@hashtag_feed).count
         end
       end
    end   
    @hasher = @hasher.sort_by {|k,v| v}.reverse
    @hasher.delete_if {|key, value| key == @hashtag_feed.name }
    @hash_namer = @hasher[0][0]
    @putput = HashtagFeed.where(:name => @hash_namer).first
    if @putput != nil 
      @top_hashfeed = @putput
    else 
      @top_hashfeed = HashtagFeed.create(name:@hash_namer)
    end 
    
    @top_hashfeed_posts = @top_hashfeed.posts
    @top_hashfeed_hash = 100 
    @top_hashfeed_posts.each do |h|
      @top_related_hashtags = h.related_hashtags.where(is_spam:false).all
      @top_related_hashtags.each do |c|
        @top_hashfeed_hash[c.name] = c.name 
      end
    end

    
    respond_with @hasher
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
