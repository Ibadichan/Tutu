10.times do |number|
  RailwayStation.create!(title: "railway station #{number}")
  Route.create!(title: "route #{number}")
  Train.create!(number: "number #{number}")
end
