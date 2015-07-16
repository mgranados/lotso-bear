# -*- encoding : utf-8 -*-
class StockFamiliesController < ApplicationController
  before_action :set_family, only: [:show, :label, :edit, :update, :history, :choose_labels, :search]

  def new
  	@stockFamily = StockFamily.new
  end

  def search
    @stock_family = StockFamily.find_by_code(params[:code])
    respond_to do |format|
      format.js { }
    end
  end

  def show
  end

  def edit
  end

  def update    
     if @stock_family.update(stock_family_params)
      flash[:success] = "Imagen cargada a #{@stock_family.generic_family.name} con código:#{@stock_family.code}!"
      redirect_to order_path(@stock_family.order)
    end
  end

  def history
  end

  def show
  end

  def choose_label
  end

  def print_label
    labels_to_print = Array.new
    family_to_print = params[:family_to_print]
    stocks_to_print = params[:spares_to_print]

    unless family_to_print.blank?
      labels_to_print << StockFamily.stock_family_label_info(family_to_print)
    end

    unless stocks_to_print.blank?
      stocks_to_print.each do |stock_id|
        labels_to_print << StockSpare.stock_spare_label_info(stock_id)
      end
    end
    generate_labels_pdf(labels_to_print)
    file = open("app/assets/pdf/barcodes.pdf")
    send_file(file, :filename => "etiquetas.pdf", :type => "application/pdf" , :disposition =>      "inline")
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
