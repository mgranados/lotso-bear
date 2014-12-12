class MoldSpare < ActiveRecord::Base
  has_many :generic_spares
  has_many :mold_attributes, dependent: :destroy
end
