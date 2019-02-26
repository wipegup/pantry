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

  def summarize_ingredients(ingredient_hash)
    list_of_ingredients = ingredient_hash.keys.inject([]) do |list, key|
      qty = ingredient_hash[key]
      info = {ingredient: key.name,
        amount: qty.to_s + " " + key.unit,
        calories: qty * key.calories}
      list << info
      list
    end
      list_of_ingredients = list_of_ingredients.sort_by{ |info| info[:calories]}.reverse
      list_of_ingredients.each{ |info| info.delete(:calories)}
      list_of_ingredients
  end
end
