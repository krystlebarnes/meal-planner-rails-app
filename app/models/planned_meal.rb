class PlannedMeal < ApplicationRecord
  belongs_to :recipe
  belongs_to :planner, :class_name => "User", :foreign_key => "planner_id"
  validates :date, :presence => {:message => "can't be blank"}
  validates :meal_type, :presence => {:message => "can't be blank"}
  scope :meal_plan, ->(start_date, end_date) { where("date BETWEEN ? AND ?", start_date, end_date) if start_date.present? }

end
