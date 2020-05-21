class PlannedMeal < ApplicationRecord
  belongs_to :recipe
  belongs_to :planner, :class_name => "User", :foreign_key => "planner_id"
  validates :date, :presence => {:message => "can't be blank"}
  validates :meal_type, :presence => {:message => "can't be blank"}
  scope :meal_plan, ->(start_date) { where("date BETWEEN ? AND (? + 13.days)", start_date) if start_date.present? }

end
