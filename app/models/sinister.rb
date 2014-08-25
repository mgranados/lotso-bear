class Sinister < ActiveRecord::Base
  has_many :insureds, :cars
end
