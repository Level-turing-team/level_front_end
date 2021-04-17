class UsersController < ApplicationController

  def show
    @current_user = current_user
    !!params[:lookup] ? @user = User.find(params[:lookup]) : @user = User.find_by(google_id: session[:user_id])
    @distance = BackendService.get_distance(@current_user.id,@user.id)[:data] unless @current_user.zip.nil? || @current_user.username.nil?
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,:bio, :zip, :picture_url)
  end
end
