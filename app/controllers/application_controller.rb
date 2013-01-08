class ApplicationController < ActionController::Base
  protect_from_forgery
  # helper_method :current_user, :logged_in?
  # include SessionsHelper

  # private
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   unless session[:user_id]
  #     flash[:notice] = "You need to log in first."
  #     redirect_to root_path
  #     return false
  #   else
  #     return true
  #   end
  # end

  ## devise methods redirect to specific pages after SI SO 
  def after_sign_in_path_for(user)
    user_path(user)       #user show  page
  end

  def after_sign_out_path_for(user)
    root_path
  end

  ## devise for guest users (used for searching and page content)
  ## https://github.com/plataformatec/devise/wiki/How-To:-Create-a-guest-user
  ## http://stackoverflow.com/questions/6391883/how-to-create-a-guest-user-w-rails-3-devise



end
