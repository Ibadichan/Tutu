FactoryBot.define do
  factory :route do
    sequence(:title) { |n| "My route title #{n}" }
    factory :invalid_route do
      title nil
    end
  end
end
