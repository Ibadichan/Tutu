FactoryBot.define do
  factory :railway_station do
    sequence(:title) { |n| "my_station_title_#{n}" }
  end
end
