class SupplierCode < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :supplier
end
