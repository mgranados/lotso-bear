class GenericCar < ActiveRecord::Base
  has_many :cars , :spareParts, :sparePartGroups
end
