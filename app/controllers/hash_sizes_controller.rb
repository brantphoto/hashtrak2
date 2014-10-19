class HashSizesController < ApplicationController
 before_action :get_hashtag_feed
 respond_to :json, :html

  def index
 		@hash_sizes = @hashtag_feed.hash_sizes.all
 		respond_with @hash_sizes, each_serializer: HashSizeSerializer
  end

  def show
  	@hash_size = HashSize.find(params[:id])
  	respond_with @hash_size, each_serializer: HashSizeSerializer
  end

  private
  def get_hashtag_feed
    @hashtag_feed = HashtagFeed.find(params[:hashtag_feed_id])
  end
end
