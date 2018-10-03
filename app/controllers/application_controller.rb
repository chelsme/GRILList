class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :most_common_list_item, :most_common_recipe_item

  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def most_common_recipe_item
    recipe_items = Array.new(0)
    Recipe.all.each do |recipe|
      recipe_items << recipe.items
    end
    arr = recipe_items.flatten
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end
  

  def most_common_list_item
    list_items = Array.new(0)
    List.all.each do |list|
      list_items << list.items
    end
    arr = list_items.flatten
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end
end


