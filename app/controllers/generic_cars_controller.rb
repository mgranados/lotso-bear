class GenericCarsController < ApplicationController
  before_action :set_generic_car, only: [:show, :edit, :destroy, :update, :assignation]
  def new
    @generic_car = GenericCar.new
    @generic_car.generic_car_images.build
    @generic_car.build_model_acronym
  end

  def show
  end

  def edit
  end

  def index
    # GenericCar.fix_generic_car_families

    @generic_cars = GenericCar.all
  end

  def update_generation
    @generic_cars = GenericCar.gen_continues_search
  end

  def create
    @generic_car = GenericCar.new(generic_car_params)
    if !@generic_car.model_acronym.blank? && @generic_car.model_acronym.model_already_exists?
      @generic_car.model_acronym = ModelAcronym.return_model(@generic_car.model_acronym.brand_id,@generic_car.model_acronym.model)
    end
    if @generic_car.save
      @generic_car.add_families
      flash[:success]= "Guardado con éxito"
      redirect_to action: 'index'
    else
      @generic_car.build_model_acronym if @generic_car.model_acronym.blank?
      render :new
    end
  end

  def update
    respond_to do |format|
      if @generic_car.update(generic_car_params)
        format.html { redirect_to @generic_car, notice: 'El Carro fue editado con éxito' }
        format.json { render :show, status: :ok, location: @generic_car }
      else
        format.html { render :edit }
        format.json { render json: @generic_car.errors, status: :unprocessable_entity }
      end
    end
  end

  def relate_generic_family
    @generic_car = GenericCar.find(params[:generic_car])
    @generic_family = GenericFamily.find(params[:generic_family])
    @generic_family_clone = @generic_family.clone_generic_family_with_generic_spares
    @generic_car.generic_families << @generic_family_clone

    redirect_to assignation_generic_car_path(@generic_car.id)
  end

  def destroy
    @generic_car.destroy
    flash[:notice] = "Borrado Exitosamente."
    redirect_to action: 'index'
  end

  def assignation
    @other_families =  GenericFamily.other_families(@generic_car)
  end

  def show_found_cars
    @generic_cars = ModelAcronym.find_by_model(params[:model].upcase).generic_cars
      unless @generic_cars.blank?
        respond_to do |format|
          format.js {}
        end
      end
  end

private

  def generic_car_params
    params.require(:generic_car).permit(:generation,:first_generation_year,:last_generation_year,:years,:gen_continues,:number_of_generation,:car_type_id,{ :car_type_ids => [] },model_acronym_attributes:[:model,:brand_id,:id,:initials],generic_car_images_attributes: [:image,:generic_car_id,:id,:_destroy])
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
