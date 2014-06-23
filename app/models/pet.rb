class Pet < ActiveRecord::Base
  belongs_to :pet_store
  scope :red, -> {where(color: "red")}
  scope :badger, -> {where(species: "badger")}

  default_scope :order => 'LOWER(name) ASC'


  validates :name, :species, :color, :pet_store_id, presence: true
  # validates :species, inclusion: { in: ["dog", "cat", "goldfish", "gold-fish", "gold fish", "dragon" ], message: "we don't sell that pet!"}
  # validates :color, exclusion: { in: ["blue", "BLUE", "Blue" ], message: "blue doesn't look good on pets, or on the website"}
  validate :validate_color
  validate :validate_species
  validate :validate_store_id

  private
    def validate_store_id
      # errors.add(:pet_store_id, "is invalid") unless PetStore.exists?(pet_store_id)
      if !PetStore.exists?(pet_store_id)
        errors.add(:pet_store_id, "invalid pet store")
      end
    end

    def validate_species
      if !["dog", "cat", "goldfish", "dragon", "gold-fish", "gold fish"].include?(species.downcase.strip)
        errors.add(:species, "we don't sell that pet!")
      end
    end

    def validate_color
      if color.downcase.strip == "blue"
        errors.add(:color, "blue doesn't look good on pets, or on the website")
      end
    end
end
