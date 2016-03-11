require 'rails_helper'

describe User, type: :model do
  describe "phone number bug" do
    let(:phone_number) { "+1 (347) 513-1236 " }
    let(:user) { FactoryGirl.create(:user, phone_number: phone_number) }

    it 'sanitizes the phone number' do
      expect(user.phone_number).to eq('13475131236')
    end
  end
end
