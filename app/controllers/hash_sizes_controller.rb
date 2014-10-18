class HashSizesController < ApplicationController
 respond_to :json, :html

  def index
 		@hash_sizes = HashtagFeed.where(id:2 ).first.hash_sizes.all
 		respond_with @hash_sizes, each_serializer: HashSizeSerializer
  end

  def show
  	@hash_size = HashSize.find(params[:id])
  	respond_with @hash_size, each_serializer: HashSizeSerializer
  end


end
