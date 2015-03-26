class OrderSupplier < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :order
end
