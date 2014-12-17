class Brand < ActiveRecord::Base
  has_many :generic_cars

  validates :acronym, uniqueness: true
  validates :name, uniqueness: true

end
