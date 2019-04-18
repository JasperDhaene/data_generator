class FridgesController < ApplicationController
  def show
    @fridge = Fridge.find(params[:id])
    @user = User.find(@fridge.user.id)

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

  def update
  # probably "not done" to delete this in a different models controller, but i don't know any better
  # TODO: doesn't check dietary restrictions of an animal
    @food = Food.find(params[:food])
    @fridge = Fridge.find(params[:id])
    if @food.destroy!
      redirect_to @fridge
    else
      #don't do error handling yet
    end
  end

  private

  def fridge_params
    params.require(:fridge).permit(%i(brand last_technical_check))
  end
end
