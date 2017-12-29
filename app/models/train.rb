class Train < ApplicationRecord
  paginates_per 5
  validates :number, presence: true
end
