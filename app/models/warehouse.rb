class Warehouse < ActiveRecord::Base
  has_many :stock_spare_parts
  validates :branch, :location, presence: true
  validates :branch, :geoLocation, uniqueness: true
end
