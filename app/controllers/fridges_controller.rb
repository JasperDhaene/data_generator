class FridgesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @fridge = Fridge.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @fridge = Fridge.new(fridge_params)
    @fridge.user = @user
    @user.fridge = @fridge

    if @fridge.save && @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
    @user = User.find(params[:user_id])
    @fridge = Fridge.new
  end

  private

  def fridge_params
    params.require(:fridge).permit(%i(brand last_technical_check))
  end
end
