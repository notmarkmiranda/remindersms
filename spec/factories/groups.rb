FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "Group Name #{n}" }
    user
  end
end
