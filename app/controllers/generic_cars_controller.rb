class GenericCarsController < ApplicationController
    def new
      @generic_car = GenericCar.new

      @generic_car.car_spare_alloys.build.build_generic_spare


    end

    def create
        @generic_car = GenericCar.new(generic_car_params)
        if @generic_car.save
          flash[:succes]= "Guardado Con exito"
          redirect_to action: 'new'
        else
          render new
        end
    end

    def generic_car_params
      params.require(:generic_car).permit(
      :brand,
      :type,
      :year,
      :generation,
      :model,
      car_spare_alloys_attributes: [
        :generic_car_id,
        :generic_spare_id,
        generic_spare_attributes:[
          :type,
          :brand,
          :name,
          :region,
          :description
        ]
      ]
    )

    end
end
