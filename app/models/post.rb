# == Schema Information
#
# Table name: posts
#
#  id      :integer          not null, primary key
#  title   :string
#  text    :text
#  user_id :integer
#

class Post < ActiveRecord::Base
  belongs_to :user
end
