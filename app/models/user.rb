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

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(email: auth['info']['email']) do |u|
      u.name = auth['info']['name']
      u.password = SecureRandom.hex
    end
  end

end
