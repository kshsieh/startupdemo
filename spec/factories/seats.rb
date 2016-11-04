# == Schema Information
#
# Table name: seats
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :seat do
    user
    course
  end
end

