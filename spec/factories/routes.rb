FactoryBot.define do
  factory :route do
    sequence(:title) { |n| "My route title #{n}" }
  end
end
