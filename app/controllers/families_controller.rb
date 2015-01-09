class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  # GET /families
  # GET /families.json
  def index
    @families = Family.all
    @molds = MoldSpare.all
  end


  # GET /families/1
  # GET /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
    if !params[:mold_spare_id].empty?
      @mold = MoldSpare.find_by_id(params[:mold_spare_id])
      count = @mold.mold_components.count
      count.times{  @family.family_generic_spare_alloys.build.build_generic_spare }
    else
      1.times{  @family.family_generic_spare_alloys.build.build_generic_spare }
    end
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: 'Family was successfully created.' }
        format.json { render action: 'show', status: :created, location: @family }
      else
        format.html { render action: 'new' }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name, :comment, family_generic_spare_alloys_attributes: [:family_id, :generic_spare_id, generic_spare_attributes:[:name]])
    end
end
