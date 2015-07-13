class ShelvesController < ApplicationController
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]
  before_action :set_warehouse, only: [:index,:new,:create, :destroy]

  # GET /shelves
  # GET /shelves.json
  def index
    @shelves = @warehouse.shelves
  end

  # GET /shelves/1
  # GET /shelves/1.json
  def show
  end

  # GET /shelves/new
  def new
    @shelf = Shelf.new
  end

  # GET /shelves/1/edit
  def edit
  end

  # POST /shelves
  # POST /shelves.json
  def create
    @shelf = Shelf.new(shelf_params)
    @shelf.warehouse = @warehouse
    respond_to do |format|
      if @shelf.save
        format.html do 
          redirect_to warehouse_shelves_path(@warehouse)
          flash[:success]= "Rack Creado con éxito"
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /shelves/1
  # PATCH/PUT /shelves/1.json
  def update
    respond_to do |format|
      if @shelf.update(shelf_params)
        format.html do
          redirect_to @shelf
          flash[:success]= "Rack Actualizado con éxito"
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /shelves/1
  # DELETE /shelves/1.json
  def destroy
    @shelf.destroy
    respond_to do |format|
      format.html { redirect_to warehouse_shelves_path(@warehouse) }
    end
  end

  def search

  end

  def store_stocks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf
      @shelf = Shelf.find(params[:id])
    end

    def set_warehouse
      @warehouse = Warehouse.find(params[:warehouse_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shelf_params
      params.require(:shelf).permit(:aisle, :row, :level, :number, :warehouse_id)
    end
end
