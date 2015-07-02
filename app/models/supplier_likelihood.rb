class SupplierLikelihood < ActiveRecord::Base
  belongs_to :generic_families
  belongs_to :suppliers
end
