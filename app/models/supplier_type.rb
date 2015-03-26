class SupplierType < ActiveRecord::Base
	has_many :suppliers
	validates :name, presence: true
end
