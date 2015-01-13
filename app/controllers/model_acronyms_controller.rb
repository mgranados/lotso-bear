class ModelAcronymsController < ApplicationController
  before_action :set_model_acronym, only: [:show, :edit, :update, :destroy]

  # GET /model_acronyms
  # GET /model_acronyms.json
  def index
    @model_acronyms = ModelAcronym.all
  end

  # GET /model_acronyms/1
  # GET /model_acronyms/1.json
  def show
  end

  # GET /model_acronyms/new
  def new
    @model_acronym = ModelAcronym.new
  end

  # GET /model_acronyms/1/edit
  def edit
  end

  # POST /model_acronyms
  # POST /model_acronyms.json
  def create
    @model_acronym = ModelAcronym.new(model_acronym_params)

    respond_to do |format|
      if @model_acronym.save
        format.html { redirect_to @model_acronym, notice: 'Model acronym was successfully created.' }
        format.json { render action: 'show', status: :created, location: @model_acronym }
      else
        format.html { render action: 'new' }
        format.json { render json: @model_acronym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_acronyms/1
  # PATCH/PUT /model_acronyms/1.json
  def update
    respond_to do |format|
      if @model_acronym.update(model_acronym_params)
        format.html { redirect_to @model_acronym, notice: 'Model acronym was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @model_acronym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_acronyms/1
  # DELETE /model_acronyms/1.json
  def destroy
    @model_acronym.destroy
    respond_to do |format|
      format.html { redirect_to model_acronyms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_acronym
      @model_acronym = ModelAcronym.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_acronym_params
      params.require(:model_acronym).permit(:brand_id, :initials, :model)
    end
end
