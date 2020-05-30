class User < ApplicationRecord
  has_secure_password
  has_many :authorizations
  has_many :planned_meals, :foreign_key => "planner_id"
  has_many :recipes, :through => :planned_meals, :foreign_key => "planner_id"
  has_many :recipes, :foreign_key => "author_id"
  validates :username, :presence => {:message => "can't be blank"}
  validates :username, :uniqueness => {:message => "has already been used" }
  validates :email, :presence => {:message => "can't be blank"}
  validates :email, :uniqueness => {:message => "has already been used" }
  validates :email, :format => { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => "must be an email" }
  validates :password, :length => { minimum: 8, :message => "must be at least 8 characters"}

  # def add_provider(auth)
  #   # Check if the provider already exists, so we don't add it twice
  #   unless Authorization.find_by(provider: auth["provider"], uid: auth["uid"])
  #     Authorization.create :user => self, :provider => auth["provider"], :uid => auth["uid"]
  #   end
  # end

end
