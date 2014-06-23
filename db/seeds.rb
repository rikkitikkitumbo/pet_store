# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stores = 5.times do |n|
  PetStore.create(name: "store#{n}")
end

pets = 3.times do |n|
  PetStore.all.each do |pet_store|
    Pet.create(name: Faker::Name.name, species: "Dog", color: Faker::Commerce.color, pet_store_id: pet_store.id)
  end
end

users = 5.times do |n|
  User.create(email: "g#{n}@g#{n}.com", password: "ggggggg#{n}")
end
