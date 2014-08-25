class Insured < ActiveRecord::Base
  belongs_to :sinister
  has_many :cars
end
