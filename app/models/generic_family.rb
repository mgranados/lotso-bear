class GenericFamily < ActiveRecord::Base
  has_many :car_likelihoods
  has_many :generic_cars, through: :car_likelihoods

  has_many :spare_likelihoods
  has_many :generic_spares, through: :spare_likelihoods

  has_many :family_acronyms

  has_many :stock_families
end
