class GenericCarsController < ApplicationController
    def new
      @generic_car = GenericCar.new

      10.times{@generic_car.genericCarGenericSpareParts.build.build_genericSparePart}


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
      :genericCarModel,
      generic_spare_parts_attributes: [
        :generic_car_id,
        :genericSparePart_id
      ],
      generic_spare_parts:[
        :genericSparePartName
      ])

    end
end
