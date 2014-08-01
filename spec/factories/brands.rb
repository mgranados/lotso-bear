require 'faker'

FactoryGirl.define do
  factory :brand do |f|
    f.name {Faker::Company.name}
  end
end
