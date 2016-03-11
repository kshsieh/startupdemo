# == Schema Information
#
# Table name: posts
#
#  id      :integer          not null, primary key
#  title   :string
#  text    :text
#  user_id :integer
#

require 'rails_helper'

describe Post, type: :model do
  let!(:user) { FactoryGirl.create(:user) }  

  describe "user" do
    let!(:post_one) { FactoryGirl.create(:post, user: user) }
    let!(:post_two) { FactoryGirl.create(:post, user: user) }

    it "has many posts" do
      expect(user.posts.count).to eq(2)
    end

    context "post" do
      it "belongs to user" do
        expect(post_one.user).to eq(user)
      end
    end
  end
end
