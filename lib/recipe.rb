require './lib/ingredient'

class Recipe
  attr_reader :name, :ingredients
  def initialize(name)
    @name = name
    @ingredients = {}
  end

end
