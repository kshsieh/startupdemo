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

class User < ActiveRecord::Base
  has_many :posts
  has_many :seats
  has_many :courses, through: :seats
end
