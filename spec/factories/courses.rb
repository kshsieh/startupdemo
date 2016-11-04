FactoryGirl.define do
  factory :course do
    name { Faker::Hipster.sentence }
  end
end
