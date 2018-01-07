require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should validate_presence_of :end_station }
  it { should validate_presence_of :start_station }

  it { should belong_to :train }
  it { should belong_to :user }
end
