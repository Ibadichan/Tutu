class RailwayStation < ApplicationRecord
  paginates_per 5
  validates :title, presence: true
end
