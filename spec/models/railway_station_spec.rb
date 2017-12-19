require 'rails_helper'

RSpec.describe RailwayStation, type: :model do
  it { should validate_presence_of :title }
end
