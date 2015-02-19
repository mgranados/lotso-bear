class GenericSpare < ActiveRecord::Base

  has_many :generic_fittables
  has_many :generic_cars, through: :generic_fittables

  has_many :spare_likelihoods
  has_many :generic_families, through: :spare_likelihoods

  has_many :stock_spares


  # before_save :generate_code

  has_many :generic_spare_images


  # def generate_code
  #   brandAcronym = brand[0..1]
  #   nameAcronym = name[0..1]
  #   self.code = (brandAcronym+nameAcronym).upcase()
  # end

end
