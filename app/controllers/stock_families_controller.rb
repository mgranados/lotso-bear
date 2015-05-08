class StockFamiliesController < ApplicationController
  before_action :set_family, only: [:show, :label]

  def new
  	@stockFamily = StockFamily.new
  end

  def edit
  end

  def show
  end

  def label
  end

  def destroy
    StockFamily.find_by_id(params[:id]).destroy
    redirect_to all_inventories_path
  end

  private
    def set_family
      @stock_family = StockFamily.find_by_id(params[:id])
    end
end
