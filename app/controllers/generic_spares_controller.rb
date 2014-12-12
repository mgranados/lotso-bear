class GenericSparesController < ApplicationController

before_action :set_generic_spare, only: [:show, :edit, :destroy, :update]

  def new
    @generic_spare = GenericSpare.new
    if params[:mold_spare_id].empty?
      @template = MoldSpare.find_by_id(params[:mold_spare_id])
    end
  end

  def show
  end

  def edit
  end

  def template
    @templates = MoldSpare.all
  end


  def index
    @generic_spares = GenericSpare.all
  end

  def create
      @generic_spare = GenericSpare.new(generic_spare_params)
      if @generic_spare.save
        flash[:succes]= "Guardado Con exito"
        redirect_to action: 'index'
      else
        render new
      end
  end

  def update
    respond_to do |format|
      if @generic_spare.update(generic_spare_params)
        format.html { redirect_to @generic_spare, notice: 'La Pieza Generica fue editada con exito' }
        format.json { render :show, status: :ok, location: @generic_spare }
      else
        format.html { render :edit }
        format.json { render json: @generic_spare.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @generic_spare.destroy
    flash[:notice] = "Borrado Exitosamente."
    redirect_to action: 'index'
  end



  def generic_spare_params
    params.require(:generic_spare).permit(
      :brand,
      :type_of_spare,
      :name,
      :region,
      :description,
      )
  end

  def set_generic_spare
    @generic_spare = GenericSpare.find(params[:id])
  end

end
