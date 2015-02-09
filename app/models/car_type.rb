class CarType < ActiveRecord::Base
  has_many :generic_cars
  has_many :car_likelihoods
end
