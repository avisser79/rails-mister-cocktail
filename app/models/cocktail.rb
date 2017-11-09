class Cocktail < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
