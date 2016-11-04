# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :post do
    user
    body { Faker::Lorem.paragraph }    
  end
end

