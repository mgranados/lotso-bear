class SparePart < ActiveRecord::Base
  has_many :stock_spare_parts
  has_and_belongs_to_many :cars

  validates :name, :carRegion, :brand, :spareCode , presence: true
  validates :spareCode, uniqueness: true
end
