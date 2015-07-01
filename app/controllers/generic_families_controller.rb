class GenericFamiliesController < ApplicationController
  before_action :set_family, only: [:show, :destroy, :edit, :count_spares, :prices, :update]

  def new
    @generic_family = GenericFamily.new
    @generic_family.spare_likelihoods.build.build_generic_spare
  end

  def create
    @generic_family = GenericFamily.new(required_params)
    if @generic_family.save
      redirect_to generic_families_path
      flash[:success] = 'Familia Creada con éxito'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @generic_family.update(required_params)
        format.html { redirect_to admin_prices_path, notice: 'El precio fue agregado con éxito' }
        format.json { render :show, status: :ok, location: @generic_family }
      else
        format.html { render :edit }
        format.json { render json: @generic_family.errors, status: :unprocessable_entity }
      end
    end
  end

  def prices
  end

  def show
  end

  def index
    @generic_families = GenericFamily.all.where(father_id: nil)
  end

  def edit
  end

  def destroy
    @generic_family.destroy
    flash[:danger] = "#{@generic_family.name} borrada con éxito"
    redirect_to action: 'index'
  end

  def not_assigned
    @generic_families = GenericFamily.not_assigned_families
    @car_types = CarType.all
  end

  def assigned
    @generic_families = GenericFamily.assigned_families
    @car_types = CarType.all
  end

  def assign
    family = params[:family_ids]
    unless family.blank?
      family.each do | f |
        family_id = f.split(',')[0].to_i
        type_id = f.split(',')[1].to_i
        type_likelihood = TypeLikelihood.new(generic_family_id: family_id, car_type_id:type_id)
        if type_likelihood.save
          GenericFamily.add_to_corresponding_cars(type_likelihood)
        end
      end
      flash[:success] = "Actualizado con éxito"
    end
    redirect_to generic_families_path
  end

  private

    def required_params
      params.require(:generic_family).permit(:code,:name, :entrance_price_cents, :departure_price_cents, :mold, {:types => []},{:family_ids => []} ,spare_likelihoods_attributes:[:id, :generic_family_id, :generic_spare_id, generic_spare_attributes:[:name,:code]])
    end

    def set_family
      @generic_family = GenericFamily.find_by_id(params[:id])
    end

end
