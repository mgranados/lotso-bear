class TypeLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :car_type

  accepts_nested_attributes_for :generic_family

end
