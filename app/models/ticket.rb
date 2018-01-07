class Ticket < ApplicationRecord
  validates :end_station, :start_station, presence: true

  belongs_to :train
  belongs_to :user
end
