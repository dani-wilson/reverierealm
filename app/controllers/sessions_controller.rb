class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] && params[:password]
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.username}"
        redirect_to user_path(user)
      else
        flash[:alert] = "Invalid credentials."
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to root_path
  end
end