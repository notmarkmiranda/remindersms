FactoryBot.define do
  factory :group do
    name { Faker::Sports::Basketball.team }
    user
  end
end
