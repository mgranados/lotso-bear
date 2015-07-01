# -*- encoding : utf-8 -*-
class AdminController < ApplicationController

  def home
  end

  def prices
    @families_priced = GenericFamily.where.not(entrance_price_cents: nil)
    @families_unpriced = GenericFamily.where.not(father_id: nil).where(entrance_price_cents: nil)
  end

end
