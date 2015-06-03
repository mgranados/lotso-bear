class Section < ActiveRecord::Base
	belongs_to :warehouse
	has_many :subsections
end
