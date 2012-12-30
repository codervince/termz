module SessionsHelper


  def log_in(user)
  	#or cookies[:permament] = user.remember_token
    cookies[:remember_token] = { value: user.remember_token,
    							expires: 6.months.from_now.utc }
    self.current_user = user
  end

  # def logged_in?
  # 	!current_user.nil?
  # end 
  def signed_in?
  	!current_user.nil?
  end


  def current_user=(user)
  	@current_user = user
  end

  def current_user
  	#assigns only if @current_user is not defined
  	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def log_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
