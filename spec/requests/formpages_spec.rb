require 'rails_helper'

describe "Form Pages" do
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

  describe "new pet_store page" do
    it "should be able to create a valid store" do
      visit new_pet_store_path
      fill_in 'pet_store_name', with: "valid store name"
      click_button 'Add Store!'
      expect(page).to have_content("You opened a new pet store!")
      expect(page).to have_content("valid store name")
    end

    it "shouldn't work with a blank name" do
      visit new_pet_store_path
      fill_in 'pet_store_name', with: ""
      click_button 'Add Store!'
      expect(page).to have_content("can't be blank")
      expect(page).to have_content("This page will be used to make a new pet store")
    end
  end

  describe "new pet page" do
    it "should be able to create a valid pet" do
      visit new_pet_store_pet_path($pet_store.id)
      fill_in 'pet_name', with: "valid pet name"
      fill_in 'pet_species', with: "cat"
      fill_in 'pet_color', with: "red"
      click_button 'Add Pet!'
      expect(page).to have_content("You created a pet!")
      expect(page).to have_content("valid pet name")
    end

    it "shouldn't work with blank things" do
      visit new_pet_store_pet_path($pet_store.id)
      fill_in 'pet_name', with: " "
      fill_in 'pet_species', with: " "
      fill_in 'pet_color', with: " "
      click_button 'Add Pet!'
      expect(page).to have_content("can't be blank")
      expect(page).to have_content("This page will help create a new pet")
    end

    it "shouldn't work with an invalid pet species" do
      visit new_pet_store_pet_path($pet_store.id)
      fill_in 'pet_name', with: "valid name"
      fill_in 'pet_species', with: "Lion"
      fill_in 'pet_color', with: "yellow"
      click_button 'Add Pet!'
      expect(page).to have_content("we don't sell that pet!")
      expect(page).to have_content("This page will help create a new pet")
    end

    it "shouldn't work with color = blue" do
      visit new_pet_store_pet_path($pet_store.id)
      fill_in 'pet_name', with: "valid name"
      fill_in 'pet_species', with: "cat"
      fill_in 'pet_color', with: "blue"
      click_button 'Add Pet!'
      expect(page).to have_content("blue doesn't look good on pets, or on the website")
      expect(page).to have_content("This page will help create a new pet")
    end

  end

  describe "edit pet_store page" do
    it "allows you to update a store" do
      visit edit_pet_store_path($pet_store.id)
      fill_in 'pet_store_name', with: "new store name"
      click_button 'Update Pet store'
      save_and_open_page
      expect(page).to have_content("You updated the store!")
    end
  end

  describe "edit pet page" do
    it "allows you to update a pet" do
      visit edit_pet_store_pet_path($pet_store.id, $pet.id)
      fill_in 'pet_name', with: "new name"
      fill_in 'pet_species', with: "gold-fish"
      fill_in 'pet_color', with: "orange"
      select "#{$pet_store.name}", :from => "pet_pet_store_id"
      click_button 'Update Pet'
      expect(page).to have_content("You changed your pet!")
    end
  end

end