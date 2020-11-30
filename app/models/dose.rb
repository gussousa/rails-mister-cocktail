class Dose < ApplicationRecord
  validates_presence_of :description
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end
