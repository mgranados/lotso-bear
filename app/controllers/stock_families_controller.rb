require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'

require 'barby/outputter/png_outputter'

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
    label_order = Order.find_by_id(params[:id])
    @stock_families = label_order.stock_families
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
