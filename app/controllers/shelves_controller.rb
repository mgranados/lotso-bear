class ShelvesController < ApplicationController
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]
  before_action :set_warehouse, only: [:index,:new,:create, :destroy, :create_bulk]

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

  def new_bulk
  end

# <STORE A STOCK IN A RACK>
  def search
  end

  def store_stocks
    begin
      @shelf = Shelf.find_by_code(params[:code])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "No Se Encontro Rack con ese código, Vuelva a Intentar."
      redirect_to shelves_search_path
      return
    end
  end


  def save_stocks
    @shelf = Shelf.find_by_code(params[:shelf_code])
    if params[:stock_families_id].blank?
      redirect_to get_store_stocks_shelf_path(@shelf.code)
      return
    else
      stock_families_ids = params[:stock_families_id]
      stock_families_ids.each do |id|
        @stock_family = StockFamily.find_by_id(id.to_i)
        @stock_family.update(shelf_id:@shelf.id)
      end
      flash[:success] = "Piezas Guardadas en el Rack con Exito!"
      redirect_to shelves_search_path
      return
    end

    # if StockFamily.exists?(code: params[:code]) 
    #   stock = StockFamily.find_by_code(params[:code])
    # elsif StockSpare.exists?(code: params[:code]) 
    #   stock = StockSpare.find_by_code(params[:code])
    # else
    #   flash[:danger] = "No se puede encontrar pieza con ese código"
    #   render acomodate_inventories_path
    #   return 0
    # end

    # if stock.update(subsection_id: )
    #   flash[:success] = "Agregado Al rack con Exito"
    # end
    render acomodate_inventories_path
  end
# </STORE A STOCK IN A RACK>

  def create_bulk
    aisle = params[:aisle]
    row = params[:row]
    level = params[:level]
    number = params[:number]

    if aisle.blank? or row.blank? or level.blank?
      flash[:danger] = "Por Favor Llena los Campos Obligatorios"
      redirect_to warehouse_shelves_bulk_new_path(@warehouse)
      return 0
    else
      for row_i in 1..row.to_i do
        for level_i in 1..level.to_i do
          if number.blank?
            Shelf.create(aisle: aisle, row: row_i, level: level_i, warehouse_id: params[:warehouse_id])
          else
            for number_i in 1..number.to_i do
              Shelf.create(aisle: aisle, row: row_i, level: level_i, number: number_i, warehouse_id: params[:warehouse_id])
            end
          end
        end
      end
    end
    flash[:success] = "Racks Creados Con Exito!"
    redirect_to warehouse_shelves_path(@warehouse)
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
