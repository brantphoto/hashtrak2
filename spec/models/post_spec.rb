require 'rails_helper'

RSpec.describe Post, :type => :model do
 before { @post = Post.create!(insta_user:InstaUser.first)}
 subject { @post }

# describe Post do
	it { should have_many(:related_hashtag_posts) }
	it { should have_many(:related_hashtags) }
	it { should belong_to(:insta_user) }
	it { should belong_to(:hashtag_feed) }
end


