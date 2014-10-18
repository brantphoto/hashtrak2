class HashSizesController < ApplicationController
 respond_to :json, :html

  def index
 		@hash_sizes = HashTagFeed.where(id: gon.hashfeed_name).hash_sizes
 		respond_with @hash_sizes, each_serializer: HashSizeSerializer
  end

  def show
  	@hash_size = HashSize.find(params[:id])
  	respond_with @hash_size, each_serializer: HashSizeSerializer
  end


end
