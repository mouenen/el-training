FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    email { "#{name}@example.com".downcase }
    sequence(:password) { |n| "#{n}#{n}#{n}#{n}#{n}#{n}" }
    password_confirmation { password }
  end
end
