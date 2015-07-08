class SupplierCodesController < ApplicationController
  before_action :select_generic_families_and_suppliers

  def new
    @supplier_code = SupplierCode.new
  end

  def edit
  end

  def create
    @supplier_code = SupplierCode.new(supplier_code_params)
    @supplier_code.generic_family = @generic_family
    @supplier_code.supplier = @supplier

    if @supplier_code.save!
      flash[:success] = "Código asignado con éxito"
      redirect_to @supplier
    else
      render 'new'
    end

  end

  def update
  end


  private
    def supplier_code_params
      params.require(:supplier_code).permit(:generic_family, :supplier, :code)
    end

    def select_generic_families_and_suppliers
      @generic_family = GenericFamily.find_by_id(params[:generic_family_id])
      @supplier = Supplier.find_by_id(params[:supplier_id])
    end
end
