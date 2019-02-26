require './lib/ingredient'
require './lib/recipe'

class CookBook

  def initialize
    @recipes = []
  end
  def summary
    return @recipes
  end
end
