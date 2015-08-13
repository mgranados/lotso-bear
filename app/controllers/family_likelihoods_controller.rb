class FamilyLikelihoodsController < ApplicationController
  before_action :set_family_likelihood, only: [:show, :edit, :update, :destroy]

  # GET /family_likelihoods
  # GET /family_likelihoods.json
  def index
    @family_likelihoods = FamilyLikelihood.all
  end

  # GET /family_likelihoods/1
  # GET /family_likelihoods/1.json
  def show
  end

  # GET /family_likelihoods/new
  def new
    @family_likelihood = FamilyLikelihood.new
  end

  # GET /family_likelihoods/1/edit
  def edit
  end

  # POST /family_likelihoods
  # POST /family_likelihoods.json
  def create
    @family_likelihood = FamilyLikelihood.new(family_likelihood_params)

    respond_to do |format|
      if @family_likelihood.save
        format.html { redirect_to @family_likelihood, notice: 'Family likelihood was successfully created.' }
        format.json { render action: 'show', status: :created, location: @family_likelihood }
      else
        format.html { render action: 'new' }
        format.json { render json: @family_likelihood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_likelihoods/1
  # PATCH/PUT /family_likelihoods/1.json
  def update
    respond_to do |format|
      if @family_likelihood.update(family_likelihood_params)
        format.html { redirect_to @family_likelihood, notice: 'Family likelihood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @family_likelihood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_likelihoods/1
  # DELETE /family_likelihoods/1.json
  def destroy
    @family_likelihood.destroy
    respond_to do |format|
      format.html { redirect_to family_likelihoods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_likelihood
      @family_likelihood = FamilyLikelihood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_likelihood_params
      params[:family_likelihood]
    end
end
