class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :name, presence: true
  validates :price, numericality: { greather_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greather_than_or_equal_to: 0 }
end
