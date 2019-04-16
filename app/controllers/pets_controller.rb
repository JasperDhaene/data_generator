class PetsController < ApplicationController
  def edit
    @pet = Pet.find(params[:id])
  end
end
