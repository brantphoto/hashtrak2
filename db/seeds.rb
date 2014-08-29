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
	{ name:"girls", category:Category.all[1]}, {name:"", category:Category.all[2]},
	{ name:"beastmode", category:Category.all[3]}, {name:"beastmode", category:Category.all[4]},
	{ name:"beastmode", category:Category.all[5]}, {name:"beastmode", category:Category.all[6]},
	{ name:"beastmode", category:Category.all[7]}, {name:"beastmode", category:Category.all[8]},
	{ name:"beastmode", category:Category.all[9]} 







