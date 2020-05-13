class Ingredient < ApplicationRecord
  belongs_to :item
  belongs_to :recipe
  validates :quantity, :presence => {:message => "can't be blank"}
  validate :valid_quantity?
  accepts_nested_attributes_for :item

  def valid_quantity?
    if !self.quantity.to_r.rationalize(0.05)
      errors.add(:quantity, "is invalid")
    end
  end

  def item_name
    item && item.name
  end

  def item_name=(name)
    self.item = Item.find_or_initialize_by(name: name)
  end

end
