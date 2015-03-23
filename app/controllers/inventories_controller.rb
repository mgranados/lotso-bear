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
	

end
