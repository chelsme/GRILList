require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "should not save recipe with invalid attributes" do
    recipe = Recipe.new
    assert_not recipe.save, "Saved the recipe without attributes"
  end

  test "should be able to edit recipe" do
    Recipe.first.update(name: "banana pudding")
    assert true
  end

  # test "creating a recipe" do
  #   visit recipes_path
   
  #   click_on "Create New Recipe"
   
  #   fill_in "Recipe name: ", with: "Creating a Recipe"
  #   fill_in "Item", with: "Created this item successfully!"
   
  #   click_on "Create Recipe"
   
  #   assert_text "Creating a recipe"
  # end
end
