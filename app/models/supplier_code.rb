class SupplierCode < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :supplier

  validates_uniqueness_of :generic_family_id, :scope => :supplier_id

  validates :code, uniqueness: true

  monetize :price_centavos, :allow_nil => true

end
