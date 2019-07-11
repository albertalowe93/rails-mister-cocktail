class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :cocktail, uniqueness: { scope: :ingredient, message: "This ingredient - cocktail pair has been taken" }
  validates :description, presence: :true, allow_blank: false
end
