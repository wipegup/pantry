require './lib/ingredient'

class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] = quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    calories = 0
    @ingredients_required.each do |ingredient, qty|
      calories += (ingredient.calories * qty)
    end
    calories
  end

end
