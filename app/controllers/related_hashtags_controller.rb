class RelatedHashtagsController < ApplicationController
  before_action :get_hashtag_feed
  respond_to :html, :json
  
  def index
    @hasher = Hash.new
    @posts = @hashtag_feed.posts

    @posts.each do |y|
      @related_hashtags = y.related_hashtags.where(is_spam:false).all
      @related_hashtags.each do |z|
        @hasher[z.name] = z.posts.where(hashtag_feed:@hashtag_feed).count
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
    @top_hashfeed_counter = 0
    @top_hashfeed_posts.each do |h|
      @top_related_hashtags = h.related_hashtags.where(is_spam:false).all
      @top_related_hashtags.each do |c|
        @top_hashfeed_counter = @top_hashfeed_counter + 1
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
