class GenericFamiliesController < ApplicationController

  before_action :set_family, only: [:show, :destroy, :edit]
  before_action :set_family, only: [:show, :destroy, :edit, :count_spares]



  def new
    @generic_family = GenericFamily.new
    # 5.times{@generic_family.spare_likelihoods.build.build_generic_spare}
    @generic_family.spare_likelihoods.build.build_generic_spare
  end

  def create
    @generic_family = GenericFamily.new(required_params)
    if @generic_family.save
      SpareLikelihood.where("generic_spare_id is null").delete_all
      redirect_to generic_families_path
      flash[:success] = "Familia Creada con éxito"
    else
      render 'new'
    end
  end

  def count_spares
    respond_to do |format|  ## Add this
      format.json { render json: {:count => @generic_family.generic_spares.count+1} }
    end
  end

  def show
    GenericCar.fix_generic_car_families
  end

  def index
    @generic_families = GenericFamily.all
  end

  def edit
  end

  def destroy
    @generic_family.destroy
    flash[:danger] = "#{@generic_family.name} borrada con éxito"
    redirect_to action: 'index'

  end

  def update
  end

  def not_assigned_families
    @generic_families = GenericFamily.not_assigned_families
    @car_types = CarType.all
  end

  def assigned_families
    @generic_families = GenericFamily.assigned_families
    @car_types = CarType.all
  end

  def assign
    family = params[:family_ids]
    family.each do | f |
      family_id = f.split(',')[0].to_i
      type_id = f.split(',')[1].to_i
      TypeLikelihood.create(generic_family_id: family_id, car_type_id:type_id)
    end
    flash[:success] = "Actualizado con éxito"
    redirect_to generic_families_path
  end

  def build_spares
    build_spares_for_families(required_params)
  end



  private
    def required_params
      params.require(:generic_family).permit(:code,:name, :mold, {:types => []},{:family_ids => []} ,spare_likelihoods_attributes:[:id, :generic_family_id, :generic_spare_id, generic_spare_attributes:[:name,:code]])
    end

    def set_family
      @generic_family = GenericFamily.find_by_id(params[:id])
    end



end
