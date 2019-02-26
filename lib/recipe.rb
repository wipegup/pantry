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

end
