class GenericSpare < ActiveRecord::Base
  #Self Referential
  # has_many :generic_spares

  #Associations that allows the relation between generic_cars and generic_spares (many_to_many)
  has_many :car_spare_alloys
  has_many :generic_cars, through: :car_spare_alloys

  #Spares in stock (real inventory)
  has_many :spares


  before_save :generate_code


  def generate_code
    brandAcronym = brand[0..1]
    nameAcronym = name[0..1]
    self.code = (brandAcronym+nameAcronym).upcase()
  end

end
