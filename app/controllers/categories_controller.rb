class CategoriesController < ApplicationController
	respond_to :html, :json
  def index
		@categories = Category.order(hashtag_feeds_count: :desc).all
		respond_with @categories, each_serializer: CategorySerializer
   end

  def show
  	@category = Category.find(params[:id])
  end
end
