# -*- encoding : utf-8 -*-
class OrderSupplier < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :order
end
