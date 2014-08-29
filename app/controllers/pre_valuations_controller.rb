class PreValuationsController < ApplicationController
  def new
    @preValuation = PreValuation.new
    @insured = Insured.new
  end

  def create
    @preValuation = PreValuation.new(pre_valuation_params)
    if @preValuation.save
      flash[:success] = "Guardado con Exito"
      redirect_to new
    else
      render new
    end
  end


  def pre_valuation_params
      params.require(:pre_valuation).permit(
      :preValuationNumber,
      :preValuationPolicyNumber,
      :preValuationSubsection,
      :preValuationExpeditionDate,
      :preValuationDate,
      :preValuationDeductibleValue,
      :preValuationCommercialValue,
      :preValuationRequiresCrane,
      :preValuationCollectionStatus,
      :preValuationSpecialConditions,
      :preValuationThirdInsured,
      :preValuationAgentName,
      :preValuationComment)
  end
end
