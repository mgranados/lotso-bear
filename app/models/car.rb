class Car < ActiveRecord::Base
  has_one :brand
  has_many :workshop_cars
  has_and_belongs_to_many :spare_parts
end
