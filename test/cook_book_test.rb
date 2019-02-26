require 'minitest/autorun'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < MiniTest::Test
  def setup
    @cookbook = CookBook.new

    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)
    @burger = Recipe.new("Burger")
    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_summary_starts_empty
    assert_equal [], @cookbook.summary
  end

  def test_summary_lists_recipes_and_ingredients_in_order
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)

    expected = [{ name: "Mac and Cheese",
                 details: {
                   ingredients:[{ingredient:"Macaroni",
                                  amount: "8 oz"},
                                  {ingredient:"Cheese",
                                    amount: "2 C"}],
                   total_calories: 440
                   }},
                { name: "Burger",
                  details: {
                    ingredients:[{ingredient: "Ground Beef",
                                  amount: "4 oz"},
                                  {ingredient: "Bun",
                                    amount: "100 g"}],
                    total_calories: 500
                    }}
                  ]
    assert_equal expected, @cookbook.summary
  end

  def test_recipe_summary_creates_summary
    expected = { name: "Mac and Cheese",
                 details: {
                   ingredients:[{ingredient:"Macaroni",
                                  amount: "8 oz"},
                                  {ingredient:"Cheese",
                                    amount: "2 C"}],
                   total_calories: 440
                   }}
    assert_equal expected, @cookbook.recipe_summary(@mac_and_cheese)
  end

  def test_summarize_ingredients
    expected = [{ingredient:"Macaroni",
                   amount: "8 oz"},
                   {ingredient:"Cheese",
                     amount: "2 C"}]
    actual = @cookbook.summarize_ingredients(@mac_and_cheese.ingredients_required)
    assert_equal expected, actual
  end
end
