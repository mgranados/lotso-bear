class CarLikelihood < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :generic_family
end
