# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

describe User, type: :model do
  let(:name) { Faker::Name.name }
  let(:phone_number) { Faker::PhoneNumber.phone_number }
  let(:user) { FactoryGirl.create(:user, name: name, phone_number: phone_number) }

  describe "some stupid tests for now" do
    it 'returns the phone number' do
      expect(user.name).to eq(name)
    end

    it 'returns the user name' do
      expect(user.phone_number).to eq(phone_number)
    end
  end

  describe 'associations' do
    describe 'having many posts' do
      let!(:post) { FactoryGirl.create(:post, user: user) }

      it 'has many posts' do
        expect(user.posts).to include(post)
      end
    end

    describe 'has many seats' do
      it 'has many seats' do
        expect(user.seats.present?).to eq(true)
      end
    end

    describe 'can attend many courses' do
      it 'has many courses' do
      end
    end
  end
end
