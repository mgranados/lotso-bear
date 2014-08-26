class Car < ActiveRecord::Base
  # belongs_to :insured,:genericCar
  has_many :spareParts
end
