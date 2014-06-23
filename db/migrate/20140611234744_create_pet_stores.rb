class CreatePetStores < ActiveRecord::Migration
  def change
    create_table :pet_stores do |t|
      t.string :name

      t.timestamps
    end

    add_index(:pet_stores, :name)

  end
end
