# -*- encoding : utf-8 -*-
class ClientActionsController < ApplicationController
  def home
  end

  def show
  end

  def get_client_car
  	code = params[:code]
  	puts code
  	@stock_car = StockCar.where(code: code).first
  	respond_to do |format|
      format.js { }
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to :controller => "client_actions", :action => "client_car_not_found"
    return
  end

  def client_car_not_found
    respond_to do |format|
      format.js{}
    end
  end

  
end
