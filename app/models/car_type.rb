class CarType < ActiveRecord::Base
  has_many :car_likelihoods

  has_many :type_likelihoods
  has_many :generic_cars, through: :type_likelihoods

end
