class GenericFamiliesController < ApplicationController
  before_action :set_family, only: [:show]



  def new
    @generic_family = GenericFamily.new
    @generic_family.generic_spares.build
  end

  def create
    @generic_family = GenericFamily.new(required_params)
    if @generic_family.save
      redirect_to generic_families_path
      flash[:success] = "Familia Creada con éxito"
    else
      render 'new'      
    end
  end

  def show
  end

  def index
    @generic_families = GenericFamily.all
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def build_spares
    build_spares_for_families(required_params)
  end


  private
    def required_params
      params.require(:generic_family).permit(:code, :number_spares_attributes => [:name, :id])
    end

    def set_family
      @generic_family = GenericFamily.find_by_id(params[:id])
    end



end
