# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  def home
  end

  def prices
    @families_priced = GenericFamily.joins(:supplier_codes).where.not(supplier_codes: {price_centavos: nil}).where.not(father_id: nil)
    @families_unpriced = GenericFamily.joins(:supplier_codes).where.not(father_id: nil).where(supplier_codes: {price_centavos: nil})
  end

  def suppliers
      @suppliers = Supplier.all
  end
end
