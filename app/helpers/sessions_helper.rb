module SessionsHelper
end

#   def log_in(user)
#   	#or cookies[:permament] = user.remember_token

#     if params[session[:remember_me]] == "1"
#             cookies[:remember_token] = { 
#                   value: user.remember_token,
#     							expires: 6.months.from_now.utc }
#     else
#       cookies[:remember_token] = nil
#     end  
#     self.current_user = user
#   end


#   def signed_in?
#   	!current_user.nil?
#   end


#   def current_user=(user)
#   	@current_user = user
#   end

#   def current_user
#   	#assigns only if @current_user is not defined
#   	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
#   end

#   def current_user?(user)
#     user == current_user
#   end


#   ## restricts access to projects
#   def signed_in_user
#     unless user_signed_in?
#       # store_location
#       redirect_to new_user_session_url, notice: "Please sign in."
#     end
#   end


#   def log_out
#     self.current_user = nil
#     cookies.delete(:remember_token)
#   end

# end
