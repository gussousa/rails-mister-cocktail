class Review < ApplicationRecord
  belongs_to :cocktail
  validates_presence_of :content, :rating
end
