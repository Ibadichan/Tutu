FactoryBot.define do
  factory :railway_station do
    sequence(:title) { |n| "my_station_title_#{n}" }
    factory :invalid_railway_station do
      title nil
    end
  end
end
