FactoryBot.define do
  factory :user do
    name {"kento"}
    sequence(:email) { |n| "kento#{n}@example.com"}
    password {"password"}
    created_at {"2020-05-12 11:35:55"}
    updated_at {"2020-05-12 11:35:55"}
  end
end
