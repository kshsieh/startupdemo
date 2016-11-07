FactoryGirl.define do
  factory :restaurant do
    name { Faker::Company.name }
    owner
  end
end
