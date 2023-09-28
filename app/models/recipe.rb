class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def total_food_items
    recipe_foods.sum(:quantity)
  end

  def total_price
    recipe_foods.joins(:food).sum('recipe_foods.quantity * foods.price')
  end
end
