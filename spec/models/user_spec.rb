# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#  created_at   :datetime
#  updated_at   :datetime
#  email        :string
#

require 'rails_helper'

describe User, type: :model do
  let(:name) { Faker::Name.name }
  let(:phone_number) { Faker::PhoneNumber.phone_number }
  let(:user) { FactoryGirl.create(:user, name: name, phone_number: phone_number) }

  describe 'validations' do
    it 'validates name presence' do
      user = User.new(phone_number: '3475131236', email: 'kevin@wework.com')
      expect { user.save! }.to raise_exception(ActiveRecord::RecordInvalid)
      user.name = 'Foo'
      expect { user.save! }.to change(User, :count).by(1)
    end

    it 'validates phone number presence' do
      user = User.new(name: 'Finn the Dog', email: 'kevin@wework.com')
      expect { user.save! }.to raise_exception(ActiveRecord::RecordInvalid)
      user.phone_number = '3475131236'
      expect { user.save! }.to change(User, :count).by(1)
    end

    it 'validates email presence' do
      user = User.new(name: 'Finn the Dog', phone_number: '3475131236')
      expect { user.save! }.to raise_exception(ActiveRecord::RecordInvalid)
      user.email = 'kevin@wework.com'
      expect { user.save! }.to change(User, :count).by(1)
    end

    context 'validating email uniqueness' do
      context 'if a user already exists with same email' do
        let!(:duplicate) { FactoryGirl.create(:user, email: 'foo@bar.baz') }

        it 'raises an exception' do
          user = User.new(
            name: 'Finn the Dog',
            phone_number: '3475131236',
            email: 'foo@bar.baz'
          )
          expect(user.valid?).to eq(false)
        end
      end

      context 'if user does not exist with same email' do
        before do
          expect(User.where(email: 'foo@bar.baz').present?).to eq(false)
        end

        it 'saves just fine' do
          user = User.new(
            name: 'Finn the Dog',
            phone_number: '3475131236',
            email: 'foo@bar.baz'
          )
          expect(user.valid?).to eq(true)
        end
      end
    end
  end

  describe 'some stupid tests for now' do
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
      before do
        3.times do
          FactoryGirl.create(:seat, user: user)
        end
      end

      it 'has many seats' do
        expect(user.seats.present?).to eq(true)
      end
    end

    describe 'can attend many courses' do
      let!(:course) { FactoryGirl.create(:course) }

      before do
        user.seats.create(course: course)
      end

      it 'has many courses' do
        expect(user.courses.present?).to eq(true)
      end
    end
  end
end
