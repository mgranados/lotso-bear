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
      # @supplier_codes = 
      #@generic_families = GenericFamily.where.not(father_id: nil)
      @generic_families_with_code = GenericFamily.joins(:supplier_codes)
      @generic_families_wo_code =  GenericFamily.where.not(id: GenericFamily.joins(:supplier_codes).select(:generic_family_id)).where.not(father_id: nil)
    end

    # GET /suppliers/new
    def new
      @supplier = Supplier.new
    end

    # GET /suppliers/1/edit
    def edit
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
