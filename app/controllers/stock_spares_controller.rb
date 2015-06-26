class StockSparesController < ApplicationController
  
  before_action :set_spare, only: [:show, :update, :edit, :history]

  def edit
  end

  def show
  end

  def update    

     if @stock_spare.update(stock_family_params)
      flash[:success] = "Imagen cargada a #{@stock_spare.generic_family.name} con código:#{@stock_spare.code}!"
      redirect_to order_path(@stock_spare.stock_family.order)
    end

  end

  def history

  end


private
    def set_spare
      @stock_spare = StockSpare.find_by_id(params[:id])
    end


  def stock_family_params
    params.require(:stock_spare).permit(:photo)
  end

end
