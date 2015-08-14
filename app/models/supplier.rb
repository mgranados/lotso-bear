# -*- encoding : utf-8 -*-
class Supplier < ActiveRecord::Base
	belongs_to :supplier_type
	has_many :stock_families
	has_many :order_suppliers

	# has_many :generic_families, through: :supplier_likelihoods
 #  	has_many :supplier_likelihoods

	has_many :orders, through: :order_suppliers
	has_many :supplies
	
	has_many :generic_families, through: :supplier_codes
	has_many :supplier_codes

	validates :name, :supplier_type_id, presence: true
end
