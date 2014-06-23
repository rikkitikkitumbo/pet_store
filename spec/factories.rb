FactoryGirl.define do
  factory :user do |f|
    f.email "gg@gg.com"
    f.password "gg123456"
  end

  factory :pet_store do |f|
    f.name "Frank's Fish"
  end

  factory :pet do
    name "greg"
    species "dog"
    color "brown"
    pet_store_id 1
  end

end



