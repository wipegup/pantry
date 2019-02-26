require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, qty|
      return false if stock_check(ingredient) < qty
    end
    return true
  end
end
