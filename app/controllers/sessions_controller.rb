class SessionsController < ApplicationController
 
 def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "#{t 'loggedin', default: 'You are now logged in'}" 
   
    else
      flash.now.alert =  "#{t 'incorrectemailpwd', default: 'Invalid email or password'}"    
      render "new"
    end
  end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "#{t 'loggedout', default: 'You are now logged out'}" 

end

end
