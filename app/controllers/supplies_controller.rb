class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = Supply.all
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    @supply = Supply.new
  end

  # GET /supplies/1/edit
  def edit
  end

# <Process Spend Supply>
  def consumer
  end

  def spend
    @employee = User.find_by_code(params[:user_code])

    if @employee.blank?
      flash[:danger] = "Empleado no encontrado"
      redirect_to consumer_supplies_path
    end
  end

  def add_supply_to_spend
    @supply = Supply.find_by_code(params[:supply_code])
      respond_to do |format|
      format.js {}
    end
  end

  def update_spend
    supplies = params[:supplies]
      supplies.each do |supply_info|
        supply = Supply.find_by_id(supply_info[:supply_id])
        if supply_info[:supply_quantity_to_spend].blank?
          flash[:danger] = "Error, no se pueden poner cantidades vacias"
          redirect_to spend_fail_supplies_path(params[:user_code])
          return 0
        elsif supply.quantity-supply_info[:supply_quantity_to_spend].to_i < 0
          flash[:danger] = "#{supply.name} se ha agotado, solo quedan #{supply.quantity}, vuelva a empezar el proceso."
          redirect_to spend_fail_supplies_path(params[:user_code])
          return 0
        else
          user = User.find_by_code(params[:user_code])
          Supply.transaction do
            supply.update(quantity:supply.quantity-supply_info[:supply_quantity_to_spend].to_i)
            Spending.create_with_cost(user,supply,supply_info[:supply_quantity_to_spend])  
          end
        end
      end
      flash[:success] = "Cantidades Actualizadas con exito"
      redirect_to consumer_supplies_path
  end
    
# </Process Spend Supply>


  # POST /supplies
  # POST /supplies.json
  def create
    @supply = Supply.new(supply_params)

    respond_to do |format|
      if @supply.save
        format.html { redirect_to @supply, notice: 'Supply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supply }
      else
        format.html { render action: 'new' }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to @supply, notice: 'Supply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to supplies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.require(:supply).permit(:name, :minimum_qty, :cost, :description, :quantity, :weight, :supplier_id, :brand, :size, :code 
        )
    end
end
