class Order < ActiveRecord::Base
  belongs_to :warehouse
  has_many :order_suppliers
  has_many :stock_families

  has_many :suppliers, through: :order_suppliers

end
