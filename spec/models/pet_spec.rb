require 'rails_helper'

describe Pet do

  before do
    FactoryGirl.create(:pet_store)
  end

    it "should be invalid if name, color, species, or pet_store_id are blank" do
      FactoryGirl.build(:pet, name: " ").should_not be_valid
      FactoryGirl.build(:pet, color: " ").should_not be_valid
      FactoryGirl.build(:pet, species: " ").should_not be_valid
    end
    it "should be invalid if species isn't a dog, cat, goldfish, or dragon" do
      FactoryGirl.build(:pet, species: "parrot").should_not be_valid
    end

    it "should be invalid if pet color is blue" do
      FactoryGirl.build(:pet, color: "blue").should_not be_valid
    end

    it "should be invalid if pet pet_store_id doesn't exist" do
      FactoryGirl.build(:pet, pet_store_id: 22).should_not be_valid
    end

    it "should be valid if valid attributes are given" do
      FactoryGirl.create(:pet).should be_valid
    end


end