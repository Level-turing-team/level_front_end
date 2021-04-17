class UsersController < ApplicationController

  def edit
    @user = User.find_by(google_id: session[:user_id])
  end

  def update
    @user = User.find_by(google_id: session[:user_id])
    BackendService.post_profile_picture(@user.id, params[:picture_url])
    if params[:username] == "" || params[:zip] == ""
      redirect_to register_path
    else
      @user.update(user_params)
      redirect_to dashboard_index_path
    end
  end

  def show
     !!params[:lookup] ? @user = User.find(params[:lookup]) : @user = User.find_by(google_id: session[:user_id])
     # Will need to @distance for distance from user on show page
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :bio, :zip, :picture_url)
  end
end
