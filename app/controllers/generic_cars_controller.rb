class GenericCarsController < ApplicationController
  before_action :set_generic_car, only: [:show, :edit, :destroy, :update]

  def new
    @generic_car = GenericCar.new
    # 15.times{  @generic_car.car_spare_alloys.build.build_generic_spare}
    5.times{  @generic_car.generic_images.build }
  end

  def show
  end

  def edit
    #  5.times{  @generic_car.generic_images.build }
  end

  def index
    @generic_cars = GenericCar.all
  end
  def update_generation
  @generic_cars = GenericCar.where(gen_continues: true)
  end

  def create
    @generic_car = GenericCar.new(generic_car_params)
    @firstyear = generic_car_params[:first_generation_year]
    @lastyear = generic_car_params[:last_generation_year]
    @genContinues = generic_car_params[:gen_continues]

    if @generic_car.save
      flash[:success]= "Guardado con exito"
      redirect_to action: 'index'
    else
      render new_generic_car_path
    end
  end
  def update
    respond_to do |format|
      if @generic_car.update(generic_car_params)
        format.html { redirect_to @generic_car, notice: 'El Carro fue editado con exito' }
        format.json { render :show, status: :ok, location: @generic_car }
      else
        format.html { render :edit }
        format.json { render json: @generic_car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @generic_car.destroy
    flash[:notice] = "Borrado Exitosamente."
    redirect_to action: 'index'
  end



  def generic_car_params
    params.require(:generic_car).permit(
    :brand_id,
    :type_of_car,
    :year,
    :generation,
    :model,
    :doors,
    :first_generation_year,
    :last_generation_year,
    :gen_continues,
    :number_of_generation,
    :code,
    :delete_image,
    generic_images_attributes: [
      :id,
      :generic_id,
      :photo
    ]

    # car_spare_alloys_attributes: [
    #   :generic_car_id,
    #   :generic_spare_id,
    #   :relation,
    #   generic_spare_attributes:[
    #     :type_of_spare,
    #     :brand,
    #     :name,
    #     :region,
    #     :description
    #   ]
    # ]
    )
  end

  def set_generic_car
    @generic_car = GenericCar.find(params[:id])
  end

  def search
    if params[:search]
      @generic_cars = GenericCar.search(params[:search])
    else
    end
  end

end
