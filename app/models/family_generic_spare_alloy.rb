class FamilyGenericSpareAlloy < ActiveRecord::Base
  belongs_to :generic_spare
  belongs_to :family

  accepts_nested_attributes_for :generic_spare

end
