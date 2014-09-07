class PreValuationsController < ApplicationController
  def new
    @preValuation = PreValuation.new
    @preValuation.cars.build
    @preValuation.insureds.build
  end

  def create
    @preValuation = PreValuation.new(pre_valuation_params)
    if @preValuation.save
      flash[:success] = "Guardado con Exito"
      redirect_to action: 'new'
    else
      render new
    end
  end

  def show
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
      :preValuationComment,
      :photo1,
      :photo2,
      :photo3,
      :photo4,
      :doc1,
      :doc2,
      :doc3,
      :doc4,
      insureds_attributes: [
        :insuredName,
        :insuredTelephone,
        :insuredEmail,
        :insuredIsThird
      ],
      :cars_attributes => [
        :carColor,
        :carDoorNumber,
        :carLicensePlates,
        :carInventoryDescription,
        :carTaxiNumber,
        :carSpecialEquipment
      ]
    )
  end
end
