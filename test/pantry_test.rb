require 'minitest/autorun'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock_starts_empty
    assert_equal ({}), @pantry.stock
  end

  def test_stock_check_default_returns_to_0
    assert_equal 0, @pantry.stock_check(@cheese)
  end
end
