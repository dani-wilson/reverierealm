class UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:message] = "Account successfully created!"
      redirect_to user_path(@user.id)
    else
      if @user.errors[:email].present?
        flash[:error] = "User must enter a valid email address."
      else
        flash[:error] = "Fields cannot be blank."
      end
      redirect_to new_user_path
    end
  end
end


private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end