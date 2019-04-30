class PetsController < ApplicationController

  def show
    @pet = Pet.find(params[:id])
    render json: @pet, status: :ok
  end

  def new
    @pet = Pet.new
    @user = User.find(params[:user_id])
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = User.find(params[:user_id])

    if @pet.save
      redirect_to pet_path(@pet)
    else
      render 'new'
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(date_of_death: Date.today)
      redirect_to user_path(@pet.user)
    else
      # panic?
    end

  end
  
  private
  def pet_params
    params.permit(%i[name type favorite_food age_in_months])
  end
end
