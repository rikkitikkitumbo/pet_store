class Pet < ActiveRecord::Base
  belongs_to :pet_store


  scope :red, -> {where(color: "red")}
  scope :badger, -> {where(species: "badger")}
  default_scope :order => 'LOWER(name) ASC'

  normalize_attributes :species, :color, :with => [ :strip, :downcase ]


  validates :name, :species, :color, :pet_store_id, presence: true
  validates :species, inclusion: { in: ["dog", "cat", "goldfish", "gold-fish", "gold fish", "dragon" ], message: "we don't sell that pet!"}
  validates :color, exclusion: { in: [ "blue" ], message: "blue doesn't look good on pets, or on the website"}

  validates :pet_store, :presence => {message: "invalid store id"}


end

