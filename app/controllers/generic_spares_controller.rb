class GenericSparesController < ApplicationController
  def destroy
    @generic_spare = GenericSpare.find(params[:id])
    car = @generic_spare.generic_cars
    @generic_spare.destroy
    redirect_to "generic_cars"
  end
end
