require './lib/ingredient'

class Recipe
  attr_reader :name, :ingredients
  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients[ingredient] = quantity
  end

end
