class DreamsController < ApplicationController
  def new
    @dream = Dream.new
  end

  def create
    @user = current_user
    @dream = @user.dreams.new(dream_params)
  
    if @dream.save
      flash[:alert] = "Entry saved."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Required fields cannot be blank."
      render :new
    end
  end
  

  private

  def dream_params
    params.require(:dream).permit(:dream_title, :dream_date, :dream_content, :additional_insights, :privacy_setting, :favorite)
  end  
end