class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotUnique, with: :not_unique_response
  helper_method :current_user

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def not_unique_response(error)
    flash[:error] = "User already exists."
    redirect_to new_user_path
  end
end
