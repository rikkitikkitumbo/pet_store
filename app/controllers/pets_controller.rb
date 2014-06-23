class PetsController < ApplicationController

  def index
    @pets = Pet.where(query_params)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
    @pet_store = PetStore.find(params[:pet_store_id])
  end

  def update
    @pets = Pet.all.order(created_at: :desc)
    @pet = Pet.find(params[:id])
    @pet_store = PetStore.find(params[:pet_store_id])

    if @pet.update_attributes(pet_params)
      flash.now[:success] = "You changed your pet!"
      render "show"
    else
      render "edit"
    end
  end

  def new
    @pet = Pet.new
    @pet_store = PetStore.find(params[:pet_store_id])
    @pet_stores = PetStore.all
  end

  def create
    @pets = Pet.all
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:success] = "You created a pet!"
      redirect_to pet_stores_path
    else
      render "new"
    end
  end

  def destroy
    @pets = Pet.all
    Pet.find(params[:id]).destroy
    flash[:success] = "You deleted a pet!!"
    redirect_to root_path

  end

  def all_pets
    @pet_stores = PetStore.all
  end

private

  def pet_params
    params.require(:pet).permit(:name, :species, :color, :pet_store_id)
  end

  def query_params
    params.permit(:color, :pet_store_id, :name, :species)
  end

end
