class Car < ActiveRecord::Base
  has_one :brand
  has_many :workshop_cars
  has_and_belongs_to_many :spare_parts

  validates :year,:carType,:idBrand,:generation,presence: true
  validates :model,presence: true ,:uniqueness => {:scope => [:carType]}
end
