require 'spec_helper'

describe Post do
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should_not allow_mass_assignment_of(:user_id) }

  describe "self.with_category_id" do
    let(:category)  { FactoryGirl.create(:category) }
    let(:category2) { FactoryGirl.create(:category) }

    let!(:posts_with_category)  { FactoryGirl.create_list(:post, 2, :category => category) }
    let!(:posts_with_category2) { FactoryGirl.create_list(:post, 2, :category => category2) }

    subject { Post.with_category_id(category.id) }

    it { should eq(posts_with_category) }
  end
end
