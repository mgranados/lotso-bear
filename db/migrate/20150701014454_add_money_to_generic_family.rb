class AddMoneyToGenericFamily < ActiveRecord::Migration
  def change
    add_money :generic_families, :entrance_price, amount: { null: true, default: nil }
    add_money :generic_families, :departure_price, amount: { null: true, default: nil }
  end
end
