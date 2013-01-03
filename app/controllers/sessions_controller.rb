class SessionsController < ApplicationController
 
 def new

  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      #log in the user
      # log_in user
      # redirect_back_or user
      session[:user_id] = user.id
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
