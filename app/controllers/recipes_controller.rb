class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_list]

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
    if @recipe.update(user_id: current_user.id)
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
    RecipeItem.where(recipe_id: params[:id]).destroy_all
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def destroy
    @recipe.recipe_items.each do |recipe_item|
      recipe_item.destroy
    end
    @recipe.destroy
    redirect_to recipes_path
  end

    def add_to_list
      @recipe.items.each do |item|
        ListItem.find_or_create_by(item_id: item.id, list_id: params[:list])
      end
      @list = List.find(params[:list])
      redirect_to @list
    end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :user_id, item_ids:[], items_attributes: [:name], recipe_items_attributes: [:item_quantity] )
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end