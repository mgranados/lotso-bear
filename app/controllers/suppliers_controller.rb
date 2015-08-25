# -*- encoding : utf-8 -*-
#module DynamicSelect

  class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:show, :edit, :update, :destroy]

    # GET /suppliers
    # GET /suppliers.json


    def index
      @suppliers = Supplier.all
      respond_to do |format|
        format.json {@suppliers}
        format.html {}
      end
    end

    # GET /suppliers/1
    # GET /suppliers/1.json
    def show
      # @generic_families_with_code = GenericFamily.with_supplier_code(@supplier)
      @generic_families_wo_code = GenericFamily.without_supplier_code(@supplier)
    end

    # GET /suppliers/new
    def new
      @supplier = Supplier.new
    end

    # GET /suppliers/1/edit
    def edit
    end

    def download_template
      @supplier = Supplier.find_by_id(params[:supplier])
      @generic_car = GenericCar.find_by_id(params[:generic_car])
      respond_to do |format|
        headers["Content-Disposition"] = "attachment; filename=\"#{@supplier.name}_#{@generic_car.model_acronym.model}_#{@generic_car.first_generation_year}__#{@generic_car.last_generation_year}.xls\"" 
        format.xls 
      end
    end

    def import
      supplier = Supplier.find_by_id(params[:supplier])
      generic_car = GenericCar.find_by_id(params[:generic_car])
      supplier.import(params[:file],generic_car)
      flash[:success] = "Datos Importados con Exíto"

      redirect_to add_codes_supplier_path(supplier,generic_car)
    end

    # POST /suppliers
    # POST /suppliers.json
    def create
      @supplier = Supplier.new(supplier_params)

      respond_to do |format|
        if @supplier.save
          format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
          format.json { render action: 'show', status: :created, location: @supplier }
        else
          format.html { render action: 'new' }
          format.json { render json: @supplier.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /suppliers/1
    # PATCH/PUT /suppliers/1.json
    def update
      respond_to do |format|
        if @supplier.update(supplier_params)
          format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @supplier.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /suppliers/1
    # DELETE /suppliers/1.json
    def destroy
      @supplier.destroy
      respond_to do |format|
        format.html { redirect_to suppliers_url }
        format.json { head :no_content }
      end
    end

    def add_codes
      @supplier = Supplier.find_by_id(params[:supplier])
      @generic_car = GenericCar.find_by_id(params[:generic_car])
      @supplier_codes = SupplierCode.joins(generic_family: :generic_cars)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_supplier
        @supplier = Supplier.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def supplier_params
        params.require(:supplier).permit(:name, :supplier_type_id)
      end
  end
#end
