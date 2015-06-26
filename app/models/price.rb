# -*- encoding : utf-8 -*-
class Price < ActiveRecord::Base
	has_one :stock_family
	has_one :stock_spare
end
