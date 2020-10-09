FactoryBot.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email + n.to_s }
    password { "password" }
  end
end
