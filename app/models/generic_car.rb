class GenericCar < ActiveRecord::Base
  has_many :cars
  has_and_belongs_to_many :generic_spares
end
