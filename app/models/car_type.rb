class CarType < ActiveRecord::Base
  has_many :generic_cars

  has_many :type_likelihoods
  # , :uniq => true
  has_many :generic_families, through: :type_likelihoods

  accepts_nested_attributes_for :type_likelihoods

 	def full_name
 		"#{name} #{doors}"
 	end
end
