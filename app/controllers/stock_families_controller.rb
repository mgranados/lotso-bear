require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'

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
      @barcode = Barby::Code128B.new(@stock_family.code)
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
