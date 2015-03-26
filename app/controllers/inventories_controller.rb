class InventoriesController < ApplicationController

  def entrance
    @supplier_types = SupplierType.all
    @suppliers = Supplier.all
  end

  def departure
  end

  def index
  end

  def show_generic_car_generic_families
  	 @generic_families_found = GenericCar.find_by_id(params[:id]).generic_families
      respond_to do |format|
          format.js { }
        # format.json { render json: {generic_cars_found: }, status: :done }
      end
    end
  	respond_to do |format|
	  format.js { }
  end

  def receive_order
    @order = Order.new
  end

  def add_new_stock
      respond_to do |format|
          format.html { render 'add_new_stock' }
          format.js 
        # format.json { render json: {generic_cars_found: }, status: :done }
      end
  end

  def all
    @all_stock = StockFamily.all
  end

  def orders
    @all_orders = Order.all
  end
	

end
