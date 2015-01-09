class GenericSpareFamily < ActiveRecord::Base
  belongs_to :generic_spare
  belongs_to :child, class_name: 'GenericSpare'

  accepts_nested_attributes_for :child
end
