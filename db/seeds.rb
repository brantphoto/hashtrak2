# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
InstaUser.destroy_all
insta_users  =  InstaUser.create([{ username:"Barrym"},
	{username:"joeyg"},{ username:"jonny"},{username:"kaitlin"},
	{username:"pete"},{username:"jayz"},{username:"larry"},
	{username:"john"},{username:"greg"},{username:"vince"}])

Category.destroy_all
catagories = Category.create([{ name:"black_and_white"}, 
	{name:"hotchicks"}, {name: "fitness"}, {name: "dogs"},
	{name:"food"}, {name: "shoes"}, {name: "male_fashion"},
	{name:"cats"}, {name: "female_fashion"}, {name: "art"}])

HashtagFeed.destroy_all
hashtag_feeds = HashtagFeed.create([{ name:"bw_masters", category:Category.all[0]},
	{ name:"girls", category:Category.all[1]}, {name:"beastmode", category:Category.all[2]},
	{ name:"pupoftheday", category:Category.all[3]}, {name:"foodporn", category:Category.all[4]},
	{ name:"kicks", category:Category.all[5]}, {name:"shirts", category:Category.all[6]},
	{ name:"kittens", category:Category.all[7]}, {name:"fashion_addict", category:Category.all[8]},
	{ name:"abstractart", category:Category.all[9]}])


Post.destroy_all 


x = Location.all 
y = Insta_User.all 
z = Hashtag_feed.all
a = [x,y,z]


posts = Post.all {location: , insta_user: , hashtag_feed:, 
	hashtags:["bnw_city_underground", "bnw_city_architecture", "bnw_city", "bnw_city_streetlife", "bnw_city_portrait", "bnw_city_landscape"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["friends", "pésacabados", "girls", "trash", "happy"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["beastmode", "life", "gettin", "gainz", "ripped", "health", "footballlife", "lads", "fitness", "healthyeating"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["cute", "pupoftheday", "aussiesofinstagram", "miniaussie", "fluffy", "instalove", "arewethereyet", "pupstagram", "iminabag", "happy_pet", "maltese", "fuzzy", "aplacetolovedogs", "slowloris", "greeneyes", "dogstagram", "pet", "ilovemydog", "dog", "aussienation", "silly", "dailyfluff", "nyc", "puppy", "instanimal", "miniaustralianshepherd"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["italy", "foodporn", "italianfood", "instafood", "yum", "roma", "bonci", "fresh", "pizza"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["bnw_city_underground", "bnw_city_architecture", "bnw_city", "bnw_city_streetlife", "bnw_city_portrait", "bnw_city_landscape"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["bnw_city_underground", "bnw_city_architecture", "bnw_city", "bnw_city_streetlife", "bnw_city_portrait", "bnw_city_landscape"]},
	{location: , insta_user: , hashtag_feed:, 
	hashtags:["bnw_city_underground", "bnw_city_architecture", "bnw_city", "bnw_city_streetlife", "bnw_city_portrait", "bnw_city_landscape"]},








