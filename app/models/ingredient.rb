class Ingredient < ApplicationRecord
  belongs_to :item
  belongs_to :recipe
  validates :quantity, :presence => {:message => "can't be blank"}
  validate :valid_quantity?

  def valid_quantity?
    if !self.quantity.to_r.rationalize(0.05)
      errors.add(:quantity, "is invalid")
  end

end
