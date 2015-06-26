class StockCarsController < ApplicationController
  before_action :set_stock_car, only: [:show, :edit, :update, :destroy]

  # GET /stock_cars
  # GET /stock_cars.json
  def index
    @stock_cars = StockCar.all
  end

  # GET /stock_cars/1
  # GET /stock_cars/1.json
  def show
  end

  # GET /stock_cars/new
  def new
    @stock_car = StockCar.new
  end

  # GET /stock_cars/1/edit
  def edit
  end

  # POST /stock_cars
  # POST /stock_cars.json
  def create
    @stock_car = StockCar.new(stock_car_params)

    respond_to do |format|
      if @stock_car.save
        format.html { redirect_to @stock_car, notice: 'Stock car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stock_car }
      else
        format.html { render action: 'new' }
        format.json { render json: @stock_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_cars/1
  # PATCH/PUT /stock_cars/1.json
  def update
    respond_to do |format|
      if @stock_car.update(stock_car_params)
        format.html { redirect_to @stock_car, notice: 'Stock car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stock_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_cars/1
  # DELETE /stock_cars/1.json
  def destroy
    @stock_car.destroy
    respond_to do |format|
      format.html { redirect_to stock_cars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_car
      @stock_car = StockCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_car_params
      params[:stock_car]
    end
end
