class Brand < ActiveRecord::Base
  has_many :generic_cars
  has_many :model_acronyms

  validates :acronym, uniqueness: true
  validates :name, uniqueness: true

end
