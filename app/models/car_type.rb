class CarType < ActiveRecord::Base
  has_many :generic_cars

  has_many :type_likelihoods
  has_many :generic_families, through: :type_likelihoods

 	def full_name
 		"#{name} #{doors}"
 	end
end
