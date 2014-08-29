require 'rails_helper'

RSpec.describe RelatedHashtagPost, :type => :model do
 before { @relatedhashtagpost = RelatedHashtagPost.create!()}
 subject { @relatedhashtagpost }

	it { should belong_to(:related_hashtag) }
	it { should belong_to(:posts) }
end
