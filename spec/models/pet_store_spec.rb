require 'rails_helper'

describe PetStore do
  it "is invalid with a blank name" do
    FactoryGirl.build(:pet_store, name: nil).should_not be_valid
  end
  it "is valid with a name" do
    FactoryGirl.build(:pet_store).should be_valid
  end
  it "the name attribute should be accessible" do
    g = FactoryGirl.build(:pet_store)
    g.name = "new name"
    g.name.should == "new name"
  end

end
