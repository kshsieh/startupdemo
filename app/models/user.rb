# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#

class User < ActiveRecord::Base
  before_save :sanitize_phone_number

  has_many :posts

  def sanitize_phone_number
    self.phone_number = phone_number.gsub(/[+()\- ]/, "")
  end
end
