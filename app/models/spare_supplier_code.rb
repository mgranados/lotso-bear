class SpareSupplierCode < ActiveRecord::Base
  belongs_to :generic_spare
  belongs_to :supplier

# Que solo pueda haber una familia con un unico precio dentro de cada proveedor
  validates_uniqueness_of :generic_spare_id, :scope => :supplier_id

  validates :code, uniqueness: true

  monetize :price_centavos, :allow_nil => true
end
