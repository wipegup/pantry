require 'minitest/autorun'
require './lib/ingredient'

class IngredientTest < MiniTest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_it_exists
    assert_instance_of Ingredient, @cheese
  end
end
