class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @warehouse = Warehouse.find_by_id(params[:warehouse_id])
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
    @warehouse = @section.warehouse
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @section.warehouse_id = params[:warehouse_id]

      if @section.save
        flash[:success] = 'Sección Creada con Exito' 
        redirect_to @section
      else
        render :new
      end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
      if @section.update(section_params)
        flash[:success] = 'Sección Actualizada con Exito' 
        redirect_to @section
      else
        render :edit
      end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:code, :warehouse_id, :name)
    end
end
