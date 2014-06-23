module PetsHelper

  def query_params
    params.permit(:color, :pet_store_id, :name, :species)
  end

end
