FactoryBot.define do
  factory :task do
    association :user
    sequence(:title) { |n| "test task#{n}" }
    sequence(:content) { |n| "My task factory#{n}" }
    created_at { Time.zone.now }
    finished_at { Time.zone.now + 1.hour }
    priority { 1 }
  end
end
