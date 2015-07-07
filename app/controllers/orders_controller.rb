# -*- encoding : utf-8 -*-
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
      #price = Price.new(entrance:family_info[:price])
      stock_family.color = family_info[:color]
      # stock_family.photo = family_info[:photo]

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

   def print_label
    labels_to_print = Array.new
    family_to_print = params[:ids_to_print]
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
