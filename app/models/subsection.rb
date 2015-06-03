class Subsection < ActiveRecord::Base
	belongs_to :section
	has_many :stock_families
	has_many :stock_spares
end
