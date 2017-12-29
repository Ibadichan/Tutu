FactoryBot.define do
  factory :train do
    sequence(:number) { |n| "train_number_#{n}" }
  end
end
