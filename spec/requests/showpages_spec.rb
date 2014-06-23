require 'rails_helper'

describe "Show Pages" do
  before do
    $pet_store = FactoryGirl.create(:pet_store)
    $pet = FactoryGirl.create(:pet)
    $user = FactoryGirl.create(:user)
    visit root_path
    fill_in 'user_email', with: $user.email
    fill_in 'user_password', with: $user.password
    click_button 'Sign in'
    # save_and_open_page
  end

  describe "pet_stores page" do
    it "should show stores and their pets" do
      visit pet_stores_path
      expect(page).to have_title('Petstore')
      expect(page).to have_content( $pet_store.name )
      (page).has_content? $pet.name
    end
  end

  describe "pet_store page" do
    it "should show a store" do
      visit pet_store_path($pet_store.id)
      expect(page).to have_content("Welcome to #{$pet_store.name}")
    end
  end

  describe "pet_store/pets page" do
    it "should show a store's pets" do
      visit pet_store_pets_path($pet_store.id)
      expect(page).to have_content("This will show all the pets within #{PetStore.find($pet_store.id).name}")
    end
  end

  describe "pet page" do
    it "should describe the pet" do
      visit pet_store_pet_path($pet_store.id, $pet.id)
      expect(page).to have_content("I am #{$pet.name} and I am a #{$pet.color} #{$pet.species} from #{PetStore.find($pet.pet_store_id).name}")
    end
  end

  describe "all pets page" do
    it "should show all the pets" do
      visit '/all_pets/'
      expect(page).to have_content("This will show ALL the pets")
      expect(page).to have_content("I am #{$pet.name} and I am a #{$pet.color} #{$pet.species} from #{PetStore.find($pet.pet_store_id).name}")
    end
  end

end
