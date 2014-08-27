class PreValuationsController < ApplicationController
  def new
    @preValuation = PreValuation.new
  end
end
