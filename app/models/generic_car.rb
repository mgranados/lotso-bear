class GenericCar < ActiveRecord::Base
  belongs_to :carBrands
  has_many :cars , :spareParts
end
