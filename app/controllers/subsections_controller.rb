class SubsectionsController < ApplicationController
  before_action :set_subsection, only: [:show, :edit, :update, :destroy]

  # GET /subsections
  # GET /subsections.json
  def index
    @subsections = Subsection.all
  end

  # GET /subsections/1
  # GET /subsections/1.json
  def show
  end

  # GET /subsections/new
  def new
    @subsection = Subsection.new
    @warehouse = Warehouse.find_by_id(params[:warehouse_id])
    @section = Section.find_by_id(params[:section_id])
  end

  # GET /subsections/1/edit
  def edit
  end

  # POST /subsections
  # POST /subsections.json
  def create
    @subsection = Subsection.new(subsection_params)
    @subsection.section_id = params[:section_id]

    respond_to do |format|
      if @subsection.save
        format.html { redirect_to @subsection, notice: 'Subsection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subsection }
      else
        format.html { render action: 'new' }
        format.json { render json: @subsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsections/1
  # PATCH/PUT /subsections/1.json
  def update
    respond_to do |format|
      if @subsection.update(subsection_params)
        format.html { redirect_to @subsection, notice: 'Subsection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsections/1
  # DELETE /subsections/1.json
  def destroy
    @subsection.destroy
    respond_to do |format|
      format.html { redirect_to subsections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsection
      @subsection = Subsection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subsection_params
      params.require(:subsection).permit(:code, :name, :section_id)
    end
end
