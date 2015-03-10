class FamilyLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :generic_car

  accepts_nested_attributes_for :generic_family

end
