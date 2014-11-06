class CarSpareAlloy < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :generic_spare

  # accepts_nested_attributes_for :generic_spare, :reject_if => proc { |a| a[:name].blank? || a[:brand].blank? }
end
