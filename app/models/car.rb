class Car < ActiveRecord::Base
  belongs_to :insured, :genericCar, :warehouse, :carStatus
  has_many :spareParts
end
