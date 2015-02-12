class Generation < ActiveRecord::Base
  has_many :car_likelihoods
  has_many :generic_car_generations
  has_many :car_likelihoods, through: :generic_car_generations, dependent: :destroy

end
