require 'rails_helper'

RSpec.describe Route, type: :model do
  it { should validate_presence_of :title }
end