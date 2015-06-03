require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'
require "prawn/measurement_extensions"
require 'barby/outputter/png_outputter'

class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def create
    
    order = Order.new
    # Order Info
    order.entrance_date = Time.now

    families = params[:stocks]

    families.each do |family_info|
      stock_family = StockFamily.create_stocks_from_generics(family_info[:id],family_info[:spares],family_info[:car_id])
      stock_family.supplier_id = family_info[:stock_family_supplier].to_i
      stock_family.supplier_code = family_info[:supplier_code].to_i
        price = Price.new(entrance:family_info[:price])
      stock_family.price = price
      stock_family.quantity = family_info[:quantity]
      order.stock_families << stock_family
    end
    
    if order.save!
      flash[:success] = "Orden Guardada Con Exíto"
      redirect_to order_path(order.id)
    end
  end


  def create2


        # entrance_date = Date.new params[:order]["entrance_date(1i)"].to_i,params[:order]["entrance_date(2i)"].to_i,params[:order]["entrance_date(3i)"].to_i

    # order.entrance_date = entrance_date
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

 def labels

    label_order = Order.find_by_id(params[:id])
    labels = Array.new

    stock_families_id_to_print = params[:ids_to_print]

    stock_families_to_print = Array.new()
    
    if !stock_families_id_to_print.blank?
      stock_families_id_to_print.each do |stid|
        stock_families_to_print << StockFamily.find_by_id(stid)
      end


     stock_families_to_print.each do |stock_family|
        barcode = Barby::Code128B.new(stock_family.code) 
        blob = Barby::PngOutputter.new(barcode).to_png(height: 40) 
        File.open("app/assets/images/barcodes/families/#{stock_family.id}.png", 'w'){|f| f.write blob }
        labels << {:png => "app/assets/images/barcodes/families/#{stock_family.id}.png", :model => stock_family.generic_family.generic_cars.first.model_acronym.model, :name => stock_family.generic_family.name.upcase, :code => stock_family.code}
      end

    end

    spares_id_to_print = params[:spares_to_print]

    spares_to_print = Array.new()
    
    if !spares_id_to_print.blank?
      spares_id_to_print.each do |spid|
        spares_to_print << StockSpare.find_by_id(spid)
      end

    #get spares
     spares_to_print.each do |spare|
        barcode = Barby::Code128B.new(spare.code)
        blob = Barby::PngOutputter.new(barcode).to_png(height: 40)
        File.open("app/assets/images/barcodes/spares/#{spare.id}.png", 'w'){|f| f.write blob }
              labels << {:png => "app/assets/images/barcodes/spares/#{spare.id}.png", :model => spare.generic_spare.generic_families.first.generic_cars.first.model_acronym.model,:name => spare.generic_spare.name.titleize, :code => spare.code}
      end

    end



   
      Prawn::Document.generate("app/assets/pdf/barcodes.pdf", top_margin: 2.15.send(:cm), right_margin: 0.79.send(:cm), bottom_margin: 1.7.send(:cm), left_margin:  0.62.send(:cm) )do
    # Prawn::Document.generate("app/assets/pdf/barcodes.pdf", margin: [2.11.send(:cm),0.79.send(:cm),1.45.send(:cm),0.62.send(:cm)]) do
      y_axis = 680
      number_labels = 0
      labels.each do |label|
        #izquierda
        if number_labels%2 == 0
          bounding_box([20,y_axis], :width => 240, :height => 95) do
            image label[:png], :at => [35, 80]
            move_down 10
            text "#{label[:model]}  #{label[:name]}",:align => :center
            move_down 50
            text "#{label[:code]}-#{label_order.entrance_date.strftime("%m/%Y")}",:align => :center

            #stroke_bounds
          end
        else
          #derecha
          bounding_box([315,y_axis], :width => 240, :height => 95) do
            image label[:png], :at => [35, 80]
            move_down 10
            text "#{label[:model]}  #{label[:name]}",:align => :center
            move_down 50
            text "#{label[:code]}-#{label_order.entrance_date.strftime("%m/%Y")}",:align => :center
            #stroke_bounds
          end
        end

        if number_labels == 13
         number_labels = 0
         y_axis=680
         start_new_page
        else
          if number_labels%2 != 0
            y_axis-=95
          end
          number_labels+=1
        end
      end
 
    end
  

    file = open("app/assets/pdf/barcodes.pdf")
    send_file(file, :filename => "implicit.pdf", :type => "application/pdf" , :disposition =>      "inline")
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:entrance_date, :warehouse_id)
    end
end
