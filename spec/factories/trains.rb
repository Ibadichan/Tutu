FactoryBot.define do
  factory :train do
    sequence(:number) { |n| "train_number_#{n}" }
    factory :invalid_train do
      number nil
    end
  end
end
