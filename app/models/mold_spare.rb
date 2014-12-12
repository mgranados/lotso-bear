class MoldSpare < ActiveRecord::Base
  has_many :generic_spares
  has_many :mold_attributes, dependent: :destroy

  accepts_nested_attributes_for :mold_attributes
end
