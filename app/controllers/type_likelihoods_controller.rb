class TypeLikelihoodsController < ApplicationController
  before_action :set_type_likelihood, only: [:show, :edit, :update, :destroy]

  # GET /type_likelihoods
  # GET /type_likelihoods.json
  def index
    @type_likelihoods = TypeLikelihood.all
  end

  # GET /type_likelihoods/1
  # GET /type_likelihoods/1.json
  def show
  end

  # GET /type_likelihoods/new
  def new
    @type_likelihood = TypeLikelihood.new
  end

  # GET /type_likelihoods/1/edit
  def edit
  end

  # POST /type_likelihoods
  # POST /type_likelihoods.json
  def create
    @type_likelihood = TypeLikelihood.new(type_likelihood_params)

    respond_to do |format|
      if @type_likelihood.save
        format.html { redirect_to @type_likelihood, notice: 'Type likelihood was successfully created.' }
        format.json { render action: 'show', status: :created, location: @type_likelihood }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_likelihood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_likelihoods/1
  # PATCH/PUT /type_likelihoods/1.json
  def update
    respond_to do |format|
      if @type_likelihood.update(type_likelihood_params)
        format.html { redirect_to @type_likelihood, notice: 'Type likelihood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_likelihood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_likelihoods/1
  # DELETE /type_likelihoods/1.json
  def destroy
    @type_likelihood.destroy
    respond_to do |format|
      format.html { redirect_to type_likelihoods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_likelihood
      @type_likelihood = TypeLikelihood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_likelihood_params
      params[:type_likelihood]
    end
end
