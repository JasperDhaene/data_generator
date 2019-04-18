require 'faker'

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

  def remove_food
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

  def update
    @fridge = Fridge.find(params[:id])
    brand = %w[cheap expensive]
    size = %w[small big]
    color = %w[orange purple white]

    rg = Random.new

    food = Food.new(
      brand: brand[rg.rand(brand.length)],
      type: params[:food],
      expiration_date: Faker::Date.forward(3),
      fridge: @fridge
    )

    case food.type
    when 'Milk'
      food.volume = rg.rand(0.5..1)
    when 'Bread'
      food.size = size[rg.rand(size.length)]
    when 'Carrot'
      food.color = color[rg.rand(color.length)]
    end

    if food.save
      redirect_to @fridge
    else
      byebug
    end

  end

  private

  def fridge_params
    params.require(:fridge).permit(%i(brand last_technical_check))
  end
end
