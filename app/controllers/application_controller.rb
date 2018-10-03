class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def redirect_to_login_page_if_not_logged_in
    if !session[:user_id]
      redirect_to login_path
    end
  end

  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def current_user_list
    @current_user.user_lists.find_bylist_
  end

end


