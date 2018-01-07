class Train < ApplicationRecord
  paginates_per 5
  validates :number, presence: true

  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation',
                               foreign_key: :railway_station_id, optional: true
  has_many :tickets
end
