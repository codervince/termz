class UsersController < ApplicationController
  def new
  	@user = User.new
  end


 def create 
 	# @user = User.new(params[:user])
 	 @user = params[:user] ? User.new(params[:user]) : User.new_guest
 	 if @user.save
 	  flash[:notice] =  t(:signedup, :default => "Signed up!")
      redirect_to root_url 
     else
      render "new"
    end

 end

def index
	@users = User.all
end

end
