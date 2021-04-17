class UsersController < ApplicationController

  def show
     !!params[:lookup] ? @user = User.find(params[:lookup]) : @user = User.find_by(google_id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,:bio, :zip, :picture_url)
  end
end
