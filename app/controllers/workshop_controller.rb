class WorkshopController < ApplicationController
  def index
  end

  def admin
  end

  def manager
    redirect_to action: admin
  end

  def operator

  end

end
