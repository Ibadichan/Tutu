require 'rails_helper'

RSpec.describe Train, type: :model do
  it { should validate_presence_of :number }

  it { should belong_to(:route) }
  it { should have_many :tickets }
  it { should belong_to(:current_station).class_name('RailwayStation') }
end
