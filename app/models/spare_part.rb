class SparePart < ActiveRecord::Base
  belongs_to :sparePartStatus, :genericCar, :car, :warehouse, :sparePartGrup, :sparePartBrand, :sparePartType
end
