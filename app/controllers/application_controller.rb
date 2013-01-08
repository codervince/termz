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
  def after_sign_in_path_for(resource)
    current_user_path
  end

  def after_sign_out_path_for(resource_or_scope)
  request.referrer
end


end
