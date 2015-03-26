class StockSpare < ActiveRecord::Base
  belongs_to :car
  belongs_to :warehouse
  belongs_to :generic_spare
  belongs_to :stock_family
  belongs_to :order

  has_many :stock_spare_images
end
