require 'rails_helper'

describe User do
  it "is invalid with a blank email or password" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  it "is invalid with an invalid email/password in bad format" do
    FactoryGirl.build(:user, password: "1234567").should_not be_valid
    addresses = %w[g@g,com g_at_g.com g.g@g. g@g+g/com]
    addresses.each do |invalid_email|
      FactoryGirl.build(:user, email: invalid_email).should_not be_valid
    end
  end
  it "is valid with a valid email/password" do
    FactoryGirl.build(:user).should be_valid
    good_addresses = %w[g@g.COM A_g-G@g.g.org g.glast@g.jp g+g@g.cn]
    good_addresses.each do |valid_email|
      FactoryGirl.build(:user, email: valid_email).should be_valid
    end
  end
  it "should be unique" do
    g = FactoryGirl.create(:user, email: "copy@copy.com")
    copy_of_g = FactoryGirl.build(:user, email: "copy@copy.com")
    copy_of_g.should_not be_valid
  end

end
