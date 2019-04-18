class PetsController < ApplicationController

  def show
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(date_of_death: Date.today)
      redirect_to user_path(@pet.user)
    else
      # panic?
    end

  end
end
