class SearchesController < ApplicationController
  respond_to :json 

  def index
  end

  def new
  	@search = Search.new
    @related_hashtags = RelatedHashtag.all
  end

  def create
    @search = Search.new(params.require(:search).permit(:topic, :hashtag_feed))
    if @search.save
      @search.preptopic
      recentposts(@search.topic)
      @search.hashtag_feed = @y
      @search.save
      redirect_to hashtag_feed_related_hashtags_path(@y.id)
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def creator(allrelatedhashes)
    allrelatedhashes.each do |r|
      @search = Search.create(topic:r.name)
      if @search.save
        recentposts(@search.topic)
        @search.hashtag_feed = @y
        @search.save
        sleep 2
      else
        respond_to do |format|
          format.html { render action: 'new' }
          format.json { render json: @search.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def recentposts(hashfeed)

    presponse = HTTParty.get("https://api.instagram.com/v1/tags/#{hashfeed}?client_id=e7e5e08b2c444bf5a395ff0d1e5427be")
    parsedobj1 = JSON.parse(presponse.body)
    @sizer = parsedobj1['data']['media_count']
    namer = parsedobj1['data']['name']
    if HashtagFeed.exists?(:name => namer)
      @y = HashtagFeed.where(:name => namer).first
      HashSize.create(size:@sizer, hashtag_feed: @y)
    else 
      @y = HashtagFeed.create(name: namer)
      HashSize.create(size: @sizer, hashtag_feed: @y)
    end

    response = HTTParty.get("https://api.instagram.com/v1/tags/#{hashfeed}/media/recent?client_id=e7e5e08b2c444bf5a395ff0d1e5427be")
    parsedobjs = JSON.parse(response.body)
    datar = parsedobjs['data']
    for i in datar do
      tags = i['tags']
      id = i['id']
      date = i['created_time']
      location = i['location']
      iguser = i['user']['id']
      igusername = i['user']['username']
      if InstaUser.exists?(:userid => iguser)
        @z = InstaUser.where(:userid => iguser).first     
      else 
        @z = InstaUser.create(userid: iguser, username: igusername)
      end
      if Post.exists?(:instagram_id => id) === false
        p = Post.create(hashtags:tags, instagram_id:id, location:location, created_time:date, hashtag_feed:@y, insta_user:@z)
        relate_to_tag(p)
      else
      end
    end
  end



  def relate_to_tag(pozt)
    array = pozt.hashtags
    array.each do |t|
	    if RelatedHashtag.exists?(:name => t)
	      x = RelatedHashtag.where(:name => t).first
	      RelatedHashtagPost.create(related_hashtag:x, post:pozt)
	    else
	      x = RelatedHashtag.create(name:t)
	      RelatedHashtagPost.create(related_hashtag:x, post:pozt)
	    end
    end
  end


  def destroy
  end 
end
