require 'minitest/autorun'
require './lib/recipe'
require './lib/ingredient'

class RecipeTest <MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_ingredients_starts_empty
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_add_ingredient_adds_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = {@cheese => 2, @mac => 8}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_ingredients_lists_all_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = [@cheese, @mac]
    assert_equal expected, @mac_and_cheese.ingredients
  end
end
