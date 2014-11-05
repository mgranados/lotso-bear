class GenericSpare < ActiveRecord::Base
  has_many :generic_spares
  has_many :car_spare_alloys
  has_many :generic_cars, through: :car_spare_alloys

end
