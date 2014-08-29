class PreValuation < ActiveRecord::Base
  has_many :insureds
  has_many :cars

  
end
