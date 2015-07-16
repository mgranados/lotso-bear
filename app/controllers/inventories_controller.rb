# -*- encoding : utf-8 -*-
class InventoriesController < ApplicationController
  def entrance
    @supplier_types = SupplierType.all
    @suppliers = Supplier.all
  end

  def departure
  end

  def search_stock
    if params[:code]
      if StockFamily.exists?(code: params[:code]) 
        redirect_to stock_family_path(StockFamily.find_by_code(params[:code]))
      elsif StockSpare.exists?(code: params[:code]) 
        redirect_to stock_spare_path(StockSpare.find_by_code(params[:code]))
      else
        flash[:danger] = "No se puede encontrar pieza con ese código"
      end
    end
  end

  def index
  end

  def add_family_with_spares_to_order
    @generic_family = GenericFamily.find_by_id(params[:family_id])
    @generic_car = GenericCar.find_by_id(params[:car_id])
    @suppliers = Supplier.all

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

  def all
    @all_stock = StockFamily.available
  end

  def orders
    @all_orders = Order.all.order(created_at: :desc)
  end

  def departure_stock_family
    if StockFamily.exists?(code: params[:code]) 
      departure_stock = StockFamily.find_by_code(params[:code])
      family = true
    elsif StockSpare.exists?(code: params[:code]) 
      departure_stock = StockSpare.find_by_code(params[:code])
      family = false
    else
      flash[:danger] = "No se puede encontrar pieza con ese código"
      render departure_inventories_path
      return 0
    end
    if departure_stock.status != 'Instalada' && departure_stock.status != 'Vendido Externo' && departure_stock.status != 'Envio Propio'
      departure_stock.update(status: params[:status]) 
      if family
        departure_stock.family_histories.create(description: "Salida - status: #{params[:status]}")
        flash[:success] = " #{departure_stock.generic_family.name}  codigo:#{departure_stock.code} salida con exito!"

      else
        departure_stock.spare_histories.create(description: "Salida - status: #{params[:status]}")
        flash[:success] = " #{departure_stock.generic_spare.name}  codigo:#{departure_stock.code} salida con exito!"
      end
      render departure_inventories_path
      return 0
    elsif !departure_stock.status.blank? && (departure_stock.status=="Instalada"|| departure_stock.status=="Vendida Externo"||departure_stock.status=="Envio Propio")
      flash[:danger] = "La pieza ya había salido: Su estado es: #{departure_stock.status}"
      render departure_inventories_path
      return 0
    end
      flash[:danger] = "Error Desconocido"
      render departure_inventories_path
  end
end
