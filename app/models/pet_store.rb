class PetStore < ActiveRecord::Base
  has_many :pets, dependent: :destroy

  validates :name, presence: true



end



