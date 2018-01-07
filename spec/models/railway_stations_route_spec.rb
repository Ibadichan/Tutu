require 'rails_helper'

RSpec.describe RailwayStationsRoute, type: :model do
  it { should belong_to :route }
  it { should belong_to :railway_station }
end
