class UsersController < ApplicationController

  def new
    @user = user.new
  end

  def create
    @user = User.new(user_params)
    if @user. save
      flash[:notice] = "Successfully created an account and signed in!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end


  private
   def user_params
     params.require(:user).permit(:name, :username, :password, :password_confirmation)
   end
end
