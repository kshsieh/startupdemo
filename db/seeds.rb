# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "CREATING 10 USERS!"
10.times do
  user = FactoryGirl.create(:user)
  puts "Creating posts for user #{ user.name }"
  rand(10).times { FactoryGirl.create(:post, user: user) }
end