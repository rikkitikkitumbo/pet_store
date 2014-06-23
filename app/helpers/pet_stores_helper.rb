module PetStoresHelper

  def store_color(name)
    case
      when name.include?("Mammals")
        "red"
      when name.include?("Fish")
        "turqouse"
      when name.include?("Mythical")
        "green"
      else
        "white"
      end
  end

end
