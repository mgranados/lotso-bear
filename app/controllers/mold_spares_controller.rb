class MoldSparesController < ApplicationController
  before_action :set_mold_spare, only: [:show, :edit, :update, :destroy]

  # GET /mold_spares
  # GET /mold_spares.json
  def index
    @mold_spares = MoldSpare.all
  end

  # GET /mold_spares/1
  # GET /mold_spares/1.json
  def show
  end

  # GET /mold_spares/new
  def new
    @mold_spare = MoldSpare.new
    20.times{ @mold_spare.mold_components.build }

  end

  # GET /mold_spares/1/edit
  def edit
  end

  # POST /mold_spares
  # POST /mold_spares.json
  def create
    @mold_spare = MoldSpare.new(mold_spare_params)

    respond_to do |format|
      if @mold_spare.save
        format.html { redirect_to @mold_spare, notice: 'Molde de pieza creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @mold_spare }
      else
        format.html { render action: 'new' }
        format.json { render json: @mold_spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mold_spares/1
  # PATCH/PUT /mold_spares/1.json
  def update
    respond_to do |format|
      if @mold_spare.update(mold_spare_params)
        format.html { redirect_to @mold_spare, notice: 'Molde de pieza actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mold_spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mold_spares/1
  # DELETE /mold_spares/1.json
  def destroy
    @mold_spare.destroy
    respond_to do |format|
      format.html { redirect_to mold_spares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mold_spare
      @mold_spare = MoldSpare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mold_spare_params
      params.require(:mold_spare).permit(
      :name, :comment, :comment2, :mold_type,
        mold_components_attributes:[
          :name
          ]
        )
    end
end
