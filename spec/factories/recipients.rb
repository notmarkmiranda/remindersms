FactoryBot.define do
  factory :recipient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { "2135551212" }
    user
  end
end
