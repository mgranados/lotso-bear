class GenericCarGeneration < ActiveRecord::Base
  belongs_to :generation
  belongs_to :generic_car

  accepts_nested_attributes_for :generation
  # , :reject_if => proc { |a| a[:name].blank? || a[:brand].blank? }

end
