class GenericCarsGenericSpares < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :generic_spare
end
