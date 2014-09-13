class PrevaluationsController < ApplicationController
  def new
    @prevaluation = Prevaluation.new
    @prevaluation.cars.build
    @prevaluation.insureds.build
  end

  def create
    @prevaluation = Prevaluation.new(pre_valuation_params)
    if @prevaluation.save
      flash[:success] = "Guardado con Exito"
      redirect_to action: 'new'
    else
      render new
    end
  end

  def show
  end


  def pre_valuation_params
    params.require(:prevaluation).permit(
      :Number,
      :PolicyNumber,
      :Subsection,
      :ExpeditionDate,
      :Date,
      :DeductibleValue,
      :CommercialValue,
      :RequiresCrane,
      :CollectionStatus,
      :SpecialConditions,
      :ThirdInsured,
      :AgentName,
      :Comment,
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
