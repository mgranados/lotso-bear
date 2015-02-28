class Brand < ActiveRecord::Base
  has_many :model_acronym

  validates :acronym, uniqueness: true
  validates :name, uniqueness: true

end
