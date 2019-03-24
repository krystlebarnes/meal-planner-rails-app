class PlannedMeal < ApplicationRecord
  belongs_to :recipe
  belongs_to :planner, :class_name => "User", :foreign_key => "planner_id"
end
