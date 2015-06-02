# -*- encoding : utf-8 -*-
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'
require "prawn/measurement_extensions"
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
    labels = Array.new
    @stock_families = label_order.stock_families
    @stock_families.each do |stock_family|
      barcode = Barby::Code128B.new(stock_family.code) 
      blob = Barby::PngOutputter.new(barcode).to_png(height: 60) 
      File.open("app/assets/images/barcodes/families/#{stock_family.id}.png", 'w'){|f| f.write blob }
      labels << "app/assets/images/barcodes/families/#{stock_family.id}.png"
      stock_family.stock_spares.each do |spare|
        barcode = Barby::Code128B.new(spare.code)
        blob = Barby::PngOutputter.new(barcode).to_png(height: 60)
        File.open("app/assets/images/barcodes/spares/#{spare.id}.png", 'w'){|f| f.write blob }
              labels << "app/assets/images/barcodes/spares/#{spare.id}.png"
      end

      Prawn::Document.generate("app/assets/pdf/barcodes.pdf", top_margin: 2.15.send(:cm), right_margin: 0.79.send(:cm), bottom_margin: 1.7.send(:cm), left_margin:  0.62.send(:cm) )do
    # Prawn::Document.generate("app/assets/pdf/barcodes.pdf", margin: [2.11.send(:cm),0.79.send(:cm),1.45.send(:cm),0.62.send(:cm)]) do
      stroke_axis
      
      bounding_box([20,700], :width => 240, :height => 95) do
        image "app/assets/images/barcodes/families/60.png", :at => [50, 85]
        stroke_bounds
      end

      bounding_box([315,700], :width => 240, :height => 95) do
                image "app/assets/images/barcodes/families/60.png", :at => [50, 85]

        stroke_bounds
      end
 
    end
    end 

    file = open("app/assets/pdf/barcodes.pdf")
    send_file(file, :filename => "implicit.pdf", :type => "application/pdf" , :disposition =>      "inline")
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
