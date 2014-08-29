require 'rails_helper'

RSpec.describe RelatedHashtag, :type => :model do
 before { @related_hashtag = Related_Hashtag.create!()}
 subject { @related_hashtag }


	it { should have_many(:related_hashtag_posts) }
	it { should have_many(:posts) }

end
