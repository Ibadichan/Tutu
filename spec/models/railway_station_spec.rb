require 'rails_helper'

RSpec.describe RailwayStation, type: :model do
  it { should validate_presence_of :title }
  it { should have_many(:railway_stations_routes).dependent(:destroy) }
  it { should have_many(:routes).through(:railway_stations_routes) }
end
