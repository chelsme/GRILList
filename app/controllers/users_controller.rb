class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :recipe_analytics, only: [:show]
  before_action :list_analytics, only: [:show]
  # before_action :redirect_to_login_page_if_not_logged_in, except: [:new, :create]  
  def index
    @users = User.all
  end   

  def show
    if session[:user_id] == params[:id].to_i
      @current_user = current_user
    end
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:alert] = 'Passwords do not match!'
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)

  end

  def recipe_analytics
    recipe_items = Array.new(0)
    Recipe.all.each do |recipe|
      recipe_items << recipe.items
    end
    recipe_items.flatten!
    data_hash = recipe_items.inject(Hash.new(0)) { |item,v| item[v] += 1; item }
    data_hash = data_hash.sort_by {|i,v| -v}
    @data_recipe = data_hash.map { |item,count| [item.name, count]}
    @data_recipe = @data_recipe[0..10]
  end

  def list_analytics
    list_items = Array.new(0)
    List.all.each do |list|
      list_items << list.items
    end
    list_items.flatten!
    data_hash = list_items.inject(Hash.new(0)) { |item,v| item[v] += 1; item }
    data_hash = data_hash.sort_by {|i,v| -v}
    @data_list = data_hash.map { |item,count| [item.name, count]}
    @data_list = @data_list[0..10]
  end
end
