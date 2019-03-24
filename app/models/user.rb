class User < ApplicationRecord
  has_secure_password
  has_many :planned_meals
  has_many :recipes, through: :planned_meals, :foreign_key => "planner_id"
  has_many :recipes, :foreign_key => "author_id"
end
