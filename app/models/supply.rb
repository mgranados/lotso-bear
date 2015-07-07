class Supply < ActiveRecord::Base
	belongs_to :supplier
	has_many :spendings
end
