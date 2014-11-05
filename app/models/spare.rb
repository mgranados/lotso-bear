class Spare < ActiveRecord::Base
  has_many :spares
  belongs_to :generic_spare
  accepts_nested_attributes_for :spares, :reject_if => proc { |a| a[:name].blank? || a[:brand].blank? }
end
