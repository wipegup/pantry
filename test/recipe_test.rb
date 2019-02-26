require 'minitest/autorun'
require './lib/recipe'
require './lib/ingredient'

class RecipeTest <MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end
end
