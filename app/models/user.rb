class User < ApplicationRecord
  has_secure_password
  has_many :planned_meals
  has_many :recipes, :through => :planned_meals, :foreign_key => "planner_id"
  has_many :recipes, :foreign_key => "author_id"
  validates :username, :presence => {:message => "can't be blank"}
  validates :username, :uniqueness => {:message => "has already been used" }
  validates :email, :presence => {:message => "can't be blank"}
  validates :email, :uniqueness => {:message => "has already been used" }
  validates :email, :format => { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => "must be an email" }
  validates :password_confirmation, :presence => {:message => "can't be blank"}
  validates :password, :length => { minimum: 8, :message => "must be at least 8 characters"}
end
