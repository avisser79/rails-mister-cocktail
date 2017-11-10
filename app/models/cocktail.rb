class Cocktail < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  has_many :doses, dependent: :destroy #this needs to be first (first associate with doses), before next association (through) can be done
  has_many :ingredients, through: :doses
end
