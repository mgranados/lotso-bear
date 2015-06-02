class InventoriesController < ApplicationController

  def entrance
    @supplier_types = SupplierType.all
    @suppliers = Supplier.all
  end

  def departure
  end

  def index
  end

  def add_family_with_spares_to_order
    @generic_family = GenericFamily.find_by_id(params[:family_id])
    @generic_car = GenericCar.find_by_id(params[:car_id])
    respond_to do |format|
      format.js {}
    end
  end

  def show_generic_car_generic_families
    @generic_car = GenericCar.find_by_id(params[:id])
  	@generic_families_found = @generic_car.generic_families

      respond_to do |format|
          format.js { }
        # format.json { render json: {generic_cars_found: }, status: :done }
      end
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
    @all_stock = StockFamily.available
  end

  def orders
    @all_orders = Order.all.order(created_at: :desc)
  end

  def departure_stock_family
    if StockFamily.exists?(code: params[:code]) 
      departure_stock = StockFamily.find_by_code(params[:code])
    elsif StockSpare.exists?(code: params[:code]) 
      departure_stock = StockSpare.find_by_code(params[:code])
    else
      flash[:danger] = "No se puede encontrar pieza con ese código"
      render departure_inventories_path
      return 0
    end
    if departure_stock.status.blank?
      departure_stock.update(status: params[:status]) 
      flash[:success] = "Pieza registrada"
      render departure_inventories_path
    elsif !departure_stock.status.blank?
      flash[:danger] = "La pieza ya había salido: Su estado es: #{departure_stock.status}"
      render departure_inventories_path
    end
  end
	

end
