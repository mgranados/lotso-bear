class GenericCar < ActiveRecord::Base
  has_many :cars
  has_many :car_spare_alloys
  has_many :generic_spares, through: :car_spare_alloys

  accepts_nested_attributes_for :car_spare_alloys
end
