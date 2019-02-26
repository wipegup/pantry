require './lib/ingredient'
require './lib/recipe'

class CookBook

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    return @recipes.map{|recipe| recipe_summary(recipe)}
  end

  def recipe_summary(recipe)

  end
end
