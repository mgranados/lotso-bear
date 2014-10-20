class GenericCarsController < ApplicationController
    def new
      @generic_car = GenericCar.new
      1.times{  @generic_car.car_spare_alloys.build.build_generic_spare}
    end

    def show
      @generic_car = GenericCar.find(params[:id])
    end

    def edit
      @generic_car = GenericCar.find(params[:id])
    end

    def index
      @generic_cars = GenericCar.all
    end

    def create
        @generic_car = GenericCar.new(generic_car_params)
        if @generic_car.save
          flash[:succes]= "Guardado Con exito"
          redirect_to action: 'index'
        else
          render new
        end
    end

    def destroy
      @generic_car = GenericCar.find(params[:id])
      @generic_car.destroy
      flash[:notice] = "Borrado Exitosamente."
      redirect_to action: 'index'
    end



    def generic_car_params
      params.require(:generic_car).permit(
        :brand,
        :type_of_car,
        :year,
        :generation,
        :model,
        car_spare_alloys_attributes: [
          :generic_car_id,
          :generic_spare_id,
          :relation,
          generic_spare_attributes:[
            :type_of_spare,
            :brand,
            :name,
            :region,
            :description
          ]
        ]
    )

    end
end
