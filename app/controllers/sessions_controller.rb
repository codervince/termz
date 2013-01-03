class SessionsController < ApplicationController
 
 def new
    if user = User.find_by_password_digest(cookies[:remember_token])
        session[:user_id] = user.id
        redirect_to user, :notice => "Welcome back #{user.name}"
    end   
      

  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      #log in the user
      # log_in user
      # redirect_back_or user
      session[:user_id] = user.id
      if params[:session][:remember_me] == "1"
            cookies[:remember_token] = { 
                  value: user.remember_token,
                  expires: 6.months.from_now.utc }
      else
        cookies[:remember_token] = nil
      end


      redirect_to user, :notice => "#{t 'loggedin', default: 'You are now logged in'}" 
   
    else
      flash.now[:error] = "#{t 'incorrectemailpwd', default: 'Invalid email or password'}"    
      render "new"
    end
  end

def destroy
  session[:user_id] = nil
  cookies[:remember_token] = nil
  # log_out
  redirect_to root_url, :notice => "#{t 'loggedout', default: 'You are now logged out'}" 

end

end
