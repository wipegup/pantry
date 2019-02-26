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
    {
    name: recipe.name,
    details:{
      total_calories: recipe.total_calories,
      ingredients: summarize_ingredients(recipe.ingredients_required)
      }
    }
  end
end
