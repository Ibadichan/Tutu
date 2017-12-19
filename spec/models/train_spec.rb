require 'rails_helper'

RSpec.describe Train, type: :model do
  it { should validate_presence_of :number }
end
