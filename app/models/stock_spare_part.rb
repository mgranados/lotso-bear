class StockSparePart < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :workshop_car
  belongs_to :spare_part

  validates :status,:idSparePart, presence: true
end
