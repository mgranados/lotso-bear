class Supplier < ActiveRecord::Base
	belongs_to :suppliers_type
	has_many :stock_families
	validates :name, :supplier_type_id, presence: true
end
