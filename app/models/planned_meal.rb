class PlannedMeal < ApplicationRecord
  belongs_to :recipe
  belongs_to :planner, :class_name => "User", :foreign_key => "planner_id"
  validates :date, :presence => {:message => "can't be blank"}
  validates :meal_type, :presence => {:message => "can't be blank"}
  validate :valid_meal_type?

  def valid_meal_type?
    if self.meal_type != "Breakfast" || "Morning Snack" || "Lunch" || "Afternoon Snack" || "Dinner"
      errors.add(:meal_type, "is invalid")
    end
  end
end
