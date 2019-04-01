class Item < ApplicationRecord
  has_many :ingredients
  has_many :recipes, :through => :planned_meals
  validates :name, :presence => {:message => "can't be blank"}
  validates :name, :uniqueness => {:message => "already exists" }
end
