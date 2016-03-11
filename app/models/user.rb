class User < ActiveRecord::Base
  before_save :sanitize_phone_number

  def sanitize_phone_number
    self.phone_number = phone_number.gsub(/[+()\- ]/, "")
  end
end
