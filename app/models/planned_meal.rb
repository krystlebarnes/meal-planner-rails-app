class PlannedMeal < ApplicationRecord
  belongs_to :recipe
  belongs_to :planner, :class_name => "User", :foreign_key => "planner_id"
  validates :date, :presence => {:message => "can't be blank"}
  validates :meal_type, :presence => {:message => "can't be blank"}
  validate :valid_meal_type?
  scope :meal_plan, ->(start_date) { where("date BETWEEN ? AND (? + 14.days)", start_date) if start_date.present? }

  def valid_meal_type?
    if self.meal_type != "Breakfast" || "Morning Snack" || "Lunch" || "Afternoon Snack" || "Dinner"
      errors.add(:meal_type, "is invalid")
    end
  end
end
