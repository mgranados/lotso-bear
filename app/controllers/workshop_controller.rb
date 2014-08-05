class WorkshopController < ApplicationController
  before_action :signed_in

  def index
  end

  def admin
    redirect_to "/#{current_user.privileges}" unless (current_user.privileges=='admin')
  end

  def manager
    redirect_to "/#{current_user.privileges}" unless (current_user.privileges=='gerente')

  end

  def capturist
    redirect_to "/#{current_user.privileges}" unless (current_user.privileges=='capturista')

  end

  def adjuster
    redirect_to "/#{current_user.privileges}" unless (current_user.privileges=='ajustador')

  end

  def operative
    redirect_to "/#{current_user.privileges}" unless (current_user.privileges=='operador')

  end

  def warehouse
    redirect_to "/#{current_user.privileges}" unless (current_user.privileges=='almacen')

  end


  private

    def signed_in
      redirect_to signin_url, notice: "Por favor, inicia sesión." unless signed_in?
    end

end
