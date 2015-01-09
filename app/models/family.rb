class Family < ActiveRecord::Base
  has_many :family_generic_spare_alloys
  has_many :generic_spares, through: :family_generic_spare_alloys
  accepts_nested_attributes_for :family_generic_spare_alloys

end
