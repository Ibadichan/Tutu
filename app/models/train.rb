class Train < ApplicationRecord
  paginates_per 5
  validates :number, presence: true

  belongs_to :route, optional: true
  has_many :tickets
end
