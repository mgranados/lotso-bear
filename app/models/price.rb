class Price < ActiveRecord::Base
	has_one :stock_family
end
