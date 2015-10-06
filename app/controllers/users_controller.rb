# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Usuario creado con éxito"
      redirect_to @user
    else
      render 'new'
    end
  end
# <SPENDING>
  def spending
    @users = User.where(privileges: "empleado")
  end

  def spending_history
    @user = User.find_by_id(params[:id])
    @month_spending = @user.get_spendings_of_month
  end
# </SPENDING>

  def update_attendances
    User.import(params[:file])
    redirect_to attendances_path
  end

  def attendances
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          flash[:sucess] = 'El Usuario fue editado con éxito'
          redirect_to @user
        end
      else
        format.html { render :edit }
      end
    end
  end
 
  private
    def user_params
      params.require(:user).permit(:name, :email, :username, :privileges, :password,
                                   :password_confirmation, :clock_id )
    end

end
