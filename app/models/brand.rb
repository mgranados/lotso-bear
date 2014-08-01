class Brand < ActiveRecord::Base
  has_many :cars
  validates :name, presence: true , uniqueness: true

end
