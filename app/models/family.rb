class Family < ActiveRecord::Base
  
  belongs_to :generic_spare
  belongs_to :child, :class_name => "GenericSpare"
end
