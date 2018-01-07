class RailwayStation < ApplicationRecord
  paginates_per 5
  validates :title, presence: true

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
end
