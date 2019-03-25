class Recipe < ApplicationRecord
  has_many :planned_meals
  has_many :planners, through: :planned_meals, :class_name => "User", :foreign_key => "planner_id"
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :recipe_ingredients
  has_many :items, through: :recipe_ingredients
end
