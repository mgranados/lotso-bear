class RemovePriceFromGenericFamily < ActiveRecord::Migration
  def change
  	if column_exists?(:generic_families, :entrance_price_cents)
    	remove_column :generic_families, :entrance_price_cents, :integer
	end
  	if column_exists?(:generic_families, :entrance_price_currency)
    	remove_column :generic_families, :entrance_price_currency, :string
    end

    if column_exists?(:generic_families, :departure_price_cents)
    	remove_column :generic_families, :departure_price_cents, :integer
    end
    if column_exists?(:generic_families, :departure_price_currency)
    	remove_column :generic_families, :departure_price_currency, :string
    end
    # 
    # remove_money :generic_families, :entrance_price, amount: { null: true, default: nil }, currency: 'USD'
    # remove_money :generic_families, :departure_price, amount: { null: true, default: nil }, currency: 'USD'
  end
end
