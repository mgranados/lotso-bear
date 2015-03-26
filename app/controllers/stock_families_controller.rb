class StockFamiliesController < ApplicationController
  def new
  	@stockFamily = StockFamily.new
  end

  def create
    order = Order.new

    generic_families = Array.new()

    order_array = params[:order]
    p "maricas"
    p order_array
    # METER SUPPLIERS
    unless order_array.empty?
      order_array.each_with_index do |stock_family_to_create, index|

        if (stock_family_to_create[1][0].has_key?(:id))
          p "corrida #{index}"
          p "#{stock_family_to_create[1][0][:id] }"

          price = Price.new
          price.entrance = stock_family_to_create[1][0][:entrance_price]
          stock_family = GenericFamily.find_by_id(stock_family_to_create[1][0][:id].to_i).generate_stock_family
          p "#{stock_family.generic_family_id}"
          p "#{price.entrance}"
          stock_family.price = price
          quantity = stock_family_to_create[1][0][:quantity].to_i
          quantity.times{ order.stock_families << stock_family.dup }
        end
      

      end
    end
      if order.save
        flash[:success] = "Orden guardada con éxito"
        redirect_to entrance_inventories_path   

      end
  end

  def edit
  end

  def destroy
    StockFamily.find_by_id(params[:id]).destroy
    redirect_to all_inventories_path
  end
end
