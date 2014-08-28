class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
 
  def new
  end

  def create
  end

  def getrecentposts(hashfeed)
    response = HTTParty.get("https://api.instagram.com/v1/tags/#{hashfeed}/media/recent?client_id=e7e5e08b2c444bf5a395ff0d1e5427be")
    parsedobjs = JSON.parse(response.body)
    datar = parsedobjs['data']
    for i in datar do
      tags = i['tags']
      id = i['id']
      date = i['created_time']
      location = i['location']
      Post.create(hashtag:tags, instagram_id:id, created_time:date)
    end
  end


  def show
  end

  def edit
  end

  def destroy
  end

end
