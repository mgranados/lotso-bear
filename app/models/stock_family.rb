class StockFamily < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :price
  belongs_to :supplier
  belongs_to :order
end
