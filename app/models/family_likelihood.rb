class FamilyLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :generic_car

  # validates :generic_family_id, :generic_car_id, uniqueness: true

  accepts_nested_attributes_for :generic_family

end
