class GenericSpare < ActiveRecord::Base

  has_many :childs, class_name: 'GenericSpare', foreign_key: 'father_id'
  belongs_to :father, class_name: 'GenericSpare'


  has_many :generic_fittables
  has_many :generic_cars, through: :generic_fittables

  has_many :spare_likelihoods
  has_many :generic_families, through: :spare_likelihoods

  has_many :stock_spares



  has_many :generic_spare_images


end
