class Pet < ActiveRecord::Base
  belongs_to :pet_store
  scope :red, -> {where(color: "red")}
  scope :badger, -> {where(species: "badger")}
  default_scope :order => 'LOWER(name) ASC'

  normalize_attributes :species, :color, :with => [ :strip, :downcase ]


  validates :name, :species, :color, :pet_store_id, presence: true
  validates :species, inclusion: { in: ["dog", "cat", "goldfish", "gold-fish", "gold fish", "dragon" ], message: "we don't sell that pet!"}
  validates :color, exclusion: { in: [ "blue" ], message: "blue doesn't look good on pets, or on the website"}
  #validate :validate_color
  #validate :validate_species
  validate :pet_store, :associated => true
  validate :validate_store_id

  private
    def validate_store_id
      # errors.add(:pet_store_id, "is invalid") unless PetStore.exists?(pet_store_id)
      if !PetStore.exists?(pet_store_id)
        errors.add(:pet_store_id, "invalid pet store")
      end
    end


end
