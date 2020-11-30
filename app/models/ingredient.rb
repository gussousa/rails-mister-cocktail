class Ingredient < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: true }, presence: true
  has_many :doses
end
