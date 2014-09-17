class CarSpareAlloy < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :generic_spare

  accepts_nested_attributes_for :generic_spare
end
