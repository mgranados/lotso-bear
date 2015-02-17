class GenericFamily < ActiveRecord::Base
  has_many :car_likelihoods
  has_many :generic_cars, through: :car_likelihoods

  has_many :spare_likelihoods
  has_many :generic_spares, through: :spare_likelihoods
  has_many :stock_families

  accepts_nested_attributes_for :generic_spares
end
