class WorkshopController < ApplicationController
  before_action :signed_in

  def index
  end

  def admin
  end

  def manager
    redirect_to action: admin
  end

  def capturist
  end

  def adjuster
  end

  def operative
  end

  def process
  end

  def warehouse
  end


  private

    def signed_in
      redirect_to signin_url, notice: "Por favor, inicia sesión." unless signed_in?
    end





end
