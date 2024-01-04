class DreamsController < ApplicationController
  def new
  end

  def create
    @user = current_user
    # require 'pry'; binding.pry
    @dream = @user.dreams.new(dream_params)
    if @dream.save
      flash[:alert] = "Entry saved."
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private 

  def dream_params
    params.permit(:dream_title, :dream_date, :dream_content)
  end
end