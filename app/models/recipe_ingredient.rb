class RecipeIngredient < ApplicationRecord
  belongs_to :item
  belongs_to :recipe
end
