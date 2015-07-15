class MonetizeSuppliersCodeGenericFamily < ActiveRecord::Migration
  def change
    add_money :supplier_codes, :price, amount: { null: true, default: nil }
  end
end
