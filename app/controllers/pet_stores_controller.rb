class PetStoresController < ApplicationController

  def index
    @pet_stores = PetStore.all
  end

  def edit
    @pet_store = PetStore.find(params[:id])
  end

  def show
    @pet_store = PetStore.find(params[:id])
  end

  def update
    @pet_store = PetStore.find(params[:id])
    if @pet_store.update_attributes(pet_store_params)
      flash[:success] = "You updated the store!"
      redirect_to pet_stores_path
    else
      render "edit"
    end
  end

  def new
    @pet_store = PetStore.new
    @pet = Pet.new
  end

  def create
    @pet_store = PetStore.new(pet_store_params)
    if @pet_store.save
      flash[:success] = "You opened a new pet store!"
      redirect_to pet_stores_path
    else
      render "new"
    end
  end


  def destroy
    @pet_store = PetStore.find(params[:id])
    if @pet_store.destroy
      flash[:success] = "You destroyed a petstore!"
      redirect_to pet_stores_path
    end
  end

  def allpets

  end


  private
  def pet_store_params
    params.require(:pet_store).permit(:name)
  end

end
