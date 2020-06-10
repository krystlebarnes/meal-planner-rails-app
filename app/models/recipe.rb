class Recipe < ApplicationRecord
  has_many :planned_meals
  has_many :planners, :through => :planned_meals, :class_name => "User", :foreign_key => "planner_id"
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :ingredients, dependent: :destroy
  has_many :items, :through => :ingredients
  has_many :instructions, dependent: :destroy
  validates :name, :presence => {:message => "can't be blank"}
  validates :prep_time, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :cook_time, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :serving_size, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :calories, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :instructions, :presence => {:message => "can't be blank"}
  scope :quick_recipes, -> { where("prep_time <= 30") }
  scope :simple_recipes, -> { where("ingredients.count <= 5")}
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |attr| attr['item_name'].blank? }
  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: proc { |attr| attr['step'].blank? }

def self.alpha
  order(:name)
end

def total_time
  self.total_time = self.prep_time + self.cook_time
end

end