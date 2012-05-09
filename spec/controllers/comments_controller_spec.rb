require 'spec_helper'

describe CommentsController do
  render_views

  before do
    stub_admin
    stub_auth user
  end

  describe 'GET index' do
    context 'Visit as admin' do
      let(:user) { FactoryGirl.create(:user, :admin => true) }

      context '3 unverified, 1 accepted, 1 declined comments exists' do
        let!(:unverified_comments) { FactoryGirl.create_list(:comment, 3, :state => 'unverified') }
        let!(:accepted_comment)    { FactoryGirl.create(:comment, :state => 'accepted') }
        let!(:declined_comment)    { FactoryGirl.create(:comment, :state => 'declined') }

        before { get :index }

        subject { response }

        it { should be_success }
        it { should render_template('index') }

        describe '@comments' do
          subject { assigns[:comments] }

          it { should be }
          it { should eq(unverified_comments) }
        end
      end
    end

    context 'Visit as user' do
      let(:user) { FactoryGirl.create(:user, :admin => false) }

      before { get :index }

      subject { response }

      it { should_not be_success }
    end
  end
end
