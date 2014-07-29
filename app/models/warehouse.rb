class Warehouse < ActiveRecord::Base
  has_many :stock_spare_parts
end
