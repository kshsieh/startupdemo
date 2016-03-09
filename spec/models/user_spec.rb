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
end
