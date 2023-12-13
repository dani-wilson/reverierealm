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
        redirect_to "/"
      end
    end
  end
end