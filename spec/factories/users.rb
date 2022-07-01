FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "user@example.com" }
    password { "password" }
    password_confirmation { "password" }

    trait :seq do
      sequence :name, "user001"
      sequence :email, "user001@example.com"
    end
  end
end
