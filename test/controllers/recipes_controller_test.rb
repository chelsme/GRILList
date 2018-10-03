require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get recipes_path
    assert_response :success
  end

  test "should get new" do
    get new_recipe_path
    assert_response :success
  end

  test "should get show" do
    recipe = recipes(:one)
    get recipe_path(recipe)
    assert_response :success
  end

  test "should get edit" do
    recipe = recipes(:one)
    get edit_recipe_path(recipe)
    assert_response :success
  end

end
