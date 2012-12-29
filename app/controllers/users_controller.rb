class UsersController < ApplicationController
  def new
  	@user = User.new
  end


 def create 
 	@user = User.new(params[:user])
 	 # @user = params[:user] ? User.new(params[:user]) : User.new_guest
 	 if @user.save
 	  flash[:notice] =  t(:signedup, :default => "Signed up!")
      redirect_to user_path(@user)
     else
      render "new"
    end

 end

def index
	@users = User.all
end


 def show
    @user = User.find(params[:id])
  end

  #develop this for user profile
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = t(:updatedprofile, :default => "Profile updated!")
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

end
