class CarLikelihood < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :car_type
end
