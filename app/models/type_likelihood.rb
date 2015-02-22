class TypeLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :car_type
end
