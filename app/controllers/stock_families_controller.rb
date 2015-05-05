class StockFamiliesController < ApplicationController
  def new
  	@stockFamily = StockFamily.new
  end

  def create
    order = Order.new
    order.entrance_date = Time.new

    order_info = params[:stocks]
    
    order_info.each do |sub_order|
      order.stock_families << StockFamily.create_stocks_from_generics(sub_order[:id])
    end
    
    if order.save!
      flash[:success] = "Orden Guardada Con Exíto"
      render orders_inventories_path
    end
  end

  def create2
    order = Order.new

    generic_families = Array.new()

    order_array = params[:order]
    p order_array
    # METER SUPPLIERS
    flag = false
    unless order_array.empty?


      new_order_array = Array.new()

      order_array.each do |stock_family_to_create| 
       p "#{stock_family_to_create[1][0].has_key?(:id)}"
        if stock_family_to_create[1][0].has_key?(:id) 
         new_order_array.push(stock_family_to_create)
        end
      end

      new_order_array.each_with_index do |stock_family_to_create, index|
                  p "#{stock_family_to_create[1][0][:supplier_id] }"
          p "#{stock_family_to_create[1][0][:entrance_price] }"
          p "#{stock_family_to_create[1][0][:quantity] }"

        if (!stock_family_to_create[1][0][:entrance_price].blank? && !stock_family_to_create[1][0][:quantity].blank? && !stock_family_to_create[1][0][:supplier_id].blank? )

          p "corrida #{index}"
          p "#{stock_family_to_create[1][0][:id] }"

          price = Price.new
          price.entrance = stock_family_to_create[1][0][:entrance_price]
          stock_family = GenericFamily.find_by_id(stock_family_to_create[1][0][:id].to_i).generate_stock_family
          p "#{stock_family.generic_family_id}"
          p "#{price.entrance}"
          stock_family.price = price

          stock_family.supplier_id = stock_family_to_create[1][0][:supplier_id].first.to_i

          if !stock_family_to_create[1][0][:image].blank?
            image = StockFamilyImage.new(image: stock_family_to_create[1][0][:image][0])  
          end 

          quantity = stock_family_to_create[1][0][:quantity].to_i
          quantity.times do
            clone = stock_family.dup 

            if !stock_family_to_create[1][0][:image].blank?
              clone.stock_family_images << image
            end

            order.stock_families << clone
          end
        else
          flag = true
        end

      end

    end

      if flag == true
          flash[:danger] = "Un campo estaba vacío"
          render add_new_stock_inventories_path
      elsif order.save
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
