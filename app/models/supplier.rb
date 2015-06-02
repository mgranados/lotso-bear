# -*- encoding : utf-8 -*-
class Supplier < ActiveRecord::Base
	belongs_to :supplier_type
	has_many :stock_families
	has_many :order_suppliers

	has_many :orders, through: :order_suppliers

	validates :name, :supplier_type_id, presence: true
end
