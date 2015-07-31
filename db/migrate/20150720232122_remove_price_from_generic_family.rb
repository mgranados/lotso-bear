class RemovePriceFromGenericFamily < ActiveRecord::Migration
  def change
    remove_column :generic_families, :entrance_price_cents, :integer
    remove_column :generic_families, :entrance_price_currency, :string

    remove_column :generic_families, :departure_price_cents, :integer
    remove_column :generic_families, :departure_price_currency, :string
    # 
    # remove_money :generic_families, :entrance_price, amount: { null: true, default: nil }, currency: 'USD'
    # remove_money :generic_families, :departure_price, amount: { null: true, default: nil }, currency: 'USD'
  end
end
