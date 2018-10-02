class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.valid?
    end
    
  end

  def show
    if session[:user_id] == params[:id].to_i
    else

    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
