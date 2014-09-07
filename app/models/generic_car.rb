class GenericCar < ActiveRecord::Base
  has_many :cars
  has_and_belongs_to_many :genericSpareParts
  has_many :sparePartGroups
end
