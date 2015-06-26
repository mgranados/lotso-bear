# -*- encoding : utf-8 -*-
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'
require "prawn/measurement_extensions"
require 'barby/outputter/png_outputter'

class StockFamiliesController < ApplicationController
  before_action :set_family, only: [:show, :label, :edit, :update, :history, :choose_label]

  def new
  	@stockFamily = StockFamily.new
  end

  def show
  end

  def edit
  end

  def update    
     if @stock_family.update(stock_family_params)
      flash[:success] = "Imagen guardada con éxito!"
      redirect_to @stock_family
    end
  end

  def history
  end

  def show
  end

  def choose_label
  end

  def print_label
  end


  def destroy
    StockFamily.find_by_id(params[:id]).destroy
    redirect_to all_inventories_path
  end

  private
    def set_family
      @stock_family = StockFamily.find_by_id(params[:id])
    end


  def stock_family_params
    params.require(:stock_family).permit(:photo)
  end

end
