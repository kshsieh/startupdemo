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

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
