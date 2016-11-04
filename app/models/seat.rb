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

class Seat < ActiveRecord::Base
  belongs_to :user 
  belongs_to :course
end
