require 'rails_helper'

describe "Deleting" do
  before do
    $pet_store = FactoryGirl.create(:pet_store)
    $pet = FactoryGirl.create(:pet)
    $pet2 = FactoryGirl.create(:pet, name: "Pet2")
    $user = FactoryGirl.create(:user)
    visit root_path
    fill_in 'user_email', with: $user.email
    fill_in 'user_password', with: $user.password
    click_button 'Sign in'
    # save_and_open_page
  end

  it "should let you delete a pet" do
    visit pet_store_pet_path($pet_store.id, $pet.id)
    click_on 'Delete'
    expect(page).to have_content('You deleted a pet!!')
    expect(page).not_to have_content($pet.name)
  end

  it "should let you delete a store and its pets" do
    visit pet_store_path($pet_store.id)
    click_on 'Delete'
    expect(page).to have_content('You destroyed a petstore!')
    expect(page).not_to have_content($pet2.name)
    expect(page).not_to have_content($pet.name)
    expect(page).not_to have_content($pet_store.name)
  end

end