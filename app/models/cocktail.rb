class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: :true
  validates :picture, presence: true
  mount_uploader :picture, PhotoUploader
end
