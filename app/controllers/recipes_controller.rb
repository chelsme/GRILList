class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    8.times do
      @recipe.items.new
    end
  end

  def create
    @recipe  = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  def show
  end

  def edit
    4.times do
      @recipe.items.new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.save
      redirect_to @recipe
    else
      redirect_to edit_recipe_path
    end
  end

  def destroy
    @recipe.recipe_items.each do |recipe_item|
      recipe_item.destroy
    end
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, item_ids:[], items_attributes: [:name], recipe_items_attributes: [:item_quantity] )
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end