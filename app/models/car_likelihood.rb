class CarLikelihood < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :generic_family
  #Years of a family. Ex: 2001-2003
  has_many :generic_car_generations
  has_many :generations, through: :generic_car_generations, dependent: :destroy
end
