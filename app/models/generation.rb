class Generation < ActiveRecord::Base
  has_many :generic_car_generations
  has_many :generic_cars, through: :generic_car_generations, dependent: :destroy

end
