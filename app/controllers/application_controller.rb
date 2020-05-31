class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  def current_user
    #if currrent user already exits return it, if not hit the database and find by id using the session hash
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #change a value into true or false
    !!current_user
  end

  def require_user
    if !logged_in?
     flash[:danger] = "You must be logged in to perform that action"
     redirect_to root_path
    end
  end
end
