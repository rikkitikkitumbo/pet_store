class CreatePets < ActiveRecord::Migration
  def change


    create_table :pets do |t|
      t.integer :pet_store_id
      t.string :name
      t.string :species
      t.string :color


      t.timestamps
    end

    add_index :pets, [:pet_store_id, :name, :species, :color]


  end


end
